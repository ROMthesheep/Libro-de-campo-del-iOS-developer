import Foundation
import UIKit
import Combine
/*:
 [Previous](@previous)
 ## Custom UIKit Publishers
 Por desgracia, no todos los elementos de UIKit estan preparados para ser usados con Combine. El UISwitch, por ejemplo, no tiene soporte para funcionar con KVO(key-value observer). Asi que debemos desarrollar publishers custom
 */
/// Un tipo de subscripcion a medida para capturar eventos del UIControl
final class UIControlSubscription<SubscriberType: Subscriber, Control: UIControl>: Subscription where SubscriberType.Input == Control {
    private var subscriber: SubscriberType?
    private let control: Control

    init(subscriber: SubscriberType, control: Control, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        control.addTarget(self, action: #selector(eventHandler), for: event)
    }

    func request(_ demand: Subscribers.Demand) {
        // Esta funcion no nos interesa ya que solo estamos aqui para cuando se produzcan los eventos
        // https://developer.apple.com/documentation/combine/subscribers/demand
    }

    func cancel() {
        subscriber = nil
    }

    @objc private func eventHandler() {
        _ = subscriber?.receive(control)
    }

    deinit {
        print("UIControlTarget deinit")
    }
}

/// Un `Publisher` a medida para trabajar con nuestro `UIControlSubscription`.
struct UIControlPublisher<Control: UIControl>: Publisher {

    typealias Output = Control
    typealias Failure = Never

    let control: Control
    let controlEvents: UIControl.Event

    init(control: Control, events: UIControl.Event) {
        self.control = control
        self.controlEvents = events
    }

    /// Esta funcion es llamada para vincular nuestro `Subscriber` al `Publisher` por medio de `subscribe(_:)`
    ///
    /// - SeeAlso: `subscribe(_:)`
    /// - Parameters:
    ///     - subscriber: El subscriptor a subscribir a `Publisher`.
    ///                   Una vez vinculado empezara a recibir valores.
    
    func receive<S>(subscriber: S) where S : Subscriber, S.Failure == UIControlPublisher.Failure, S.Input == UIControlPublisher.Output {
        subscriber.receive(subscription: UIControlSubscription(subscriber: subscriber, control: control, event: controlEvents))
    }
}

/// Extendemos los tipos de `UIControl` para que puedas producir un publisher `UIControl.Event`.
protocol CombineCompatible { }
extension UIControl: CombineCompatible { }
extension CombineCompatible where Self: UIControl {
    func publisher(for events: UIControl.Event) -> UIControlPublisher<Self> {
        return UIControlPublisher(control: self, events: events)
    }
}

/*:
 ## respondiendo a eventos de UITouch
 #### Con el codigo anterior podemos facilmente crear un publiser para escuchar los eventos de `UIButton`
*/
let button = UIButton()
let subscription = button.publisher(for: .touchUpInside).sink { button in
    print("Button is pressed!")
}
button.sendActions(for: .touchUpInside)
subscription.cancel()

/*:
 ## Solving the UISwitch KVO problem
 #### As the `UISwitch.isOn` property does not support KVO this extension can become handy.
 */
/*:
 ## Solventando el problema de no tener KVO en UISwitch
 #### Como la propiedad `UISwitch.isOn` no soporta KVO esta extension nos será util.
 */

extension CombineCompatible where Self: UISwitch {
    /// As the `UISwitch.isOn` property does not support KVO this publisher can become handy.
    /// The only downside is that it does not work with programmatically changing `isOn`, but it only responds to UI changes.
    /// la unica pega es que no funiona al de forma programatica cambiar el `isOn`, pero si que responde a inputs desde el UI.
    
    var isOnPublisher: AnyPublisher<Bool, Never> {
        return publisher(for: [.allEditingEvents, .valueChanged]).map { $0.isOn }.eraseToAnyPublisher()
    }
}

let switcher = UISwitch()
switcher.isOn = false
let submitButton = UIButton()
submitButton.isEnabled = false

switcher.isOnPublisher.assign(to: \.isEnabled, on: submitButton)

/// As the `isOn` property is not sending out `valueChanged` events itself, we need to do this manually here.
/// This is the same behavior as it would be if the user switches the `UISwitch` in-app.
/// Como la propiedad `isOn` no esta emitiendo eventos `valueChanged` por ella misma, lo añadimos manualmente aqui.
/// Esto es equivalente a que el usuario pulse el `UISwitch` in-app.
switcher.isOn = true
switcher.sendActions(for: .valueChanged)
print(submitButton.isEnabled)
//: [Next](@next)
