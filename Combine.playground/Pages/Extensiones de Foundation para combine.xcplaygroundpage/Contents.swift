//: [Previous](@previous)

import Foundation
import Combine
import UIKit

/*:
 ### Notificaciones
 */
NotificationCenter.default.publisher(for: .NSSystemClockDidChange)

/*:
 ### Bindeo a NSObject
 */
let ageLabel = UILabel()
Just(28)
    .map { "Age is \($0)" }
    .assign(to: \.text, on: ageLabel)
print(ageLabel)

/*:
### Un Timer con un publisher
- este tiene una particularidad, es un 'connectable'
- ... usa 'autoconnect' para iniciarse de forma automatica al subscribirse un subscriptor
*/

let publisher = Timer
    .publish(every: 1.0, on: .main, in: .common)
    .autoconnect()

print("Timer1 iniciado!")
let timer1 = publisher
    .sink { value in
        print("La hora actual para el timer 1 es: \(value.formatted(date: .omitted, time: .standard))")
    }
var timer2: AnyCancellable?

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    timer2 = publisher
        .sink { value in
            print("La hora actual para el timer 2 es: \(value.formatted(date: .complete, time: .standard))")
        }
    print("Timer2 iniciado!")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
    timer1.cancel()
    print("Timer1 parado!")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 13) {
    timer2?.cancel()
    print("Timer2 parado!")
}


//: [Next](@next)
