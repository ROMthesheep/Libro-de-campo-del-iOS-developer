//: [Previous](@previous)

import Foundation

/**
 El patrón Mediator es un patrón de diseño conductual que tiene como objetivo desacoplar las comunicaciones entre objetos proporcionando un protocolo mediador. El patrón Mediator hace que la comunicación entre objetos sea poco acoplada creando una capa intermedia y eliminando la necesidad de referenciar explícitamente a los receptores del mensaje objetivo desde el emisor. El patrón hace que la lógica de interacción sea reemplazable en tiempo de ejecución, lo que significa que un Mediator puede ser reemplazado por otro durante el tiempo de ejecución de una aplicación.

 Otro beneficio del uso del patrón es que las relaciones de muchos a muchos pueden ser fácilmente construidas. Con algunas modificaciones menores, incluso podemos extender el patrón y hacerlo interactuable de uno a muchos o de muchos a uno, dependiendo de los requisitos.
 */

protocol Receivable {
    var id: String { get }
    func receive(message: [String : Any])
}

enum MediatorError: Error {
    case missingReceiver
}

protocol Mediator {

    var receivers: [Receivable] { get set }
    
    /// Sends the specified message to all the registered receivers except the sender
    ///
    /// - Parameters:
    ///   - message: is a message that will be delivered to all the receivers
    ///   - sender: is a sender that conforms to Receivable protocol
    func send(message: [String : Any], sender: Receivable)
    
    /// Sends the specified message to the concrete receiver
    ///
    /// - Parameters:
    ///   - message: is a message that will be delivered to all the receivers
    ///   - receiver: is a receiver that conforms to Receivable protocol
    func send(message: [String : Any], receiver: Receivable) throws
}

//: [Next](@next)
