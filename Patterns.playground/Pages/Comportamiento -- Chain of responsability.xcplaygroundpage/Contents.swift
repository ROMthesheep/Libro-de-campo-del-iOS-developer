//: [Previous](@previous)

import Foundation

/**
 El patrón de diseño Chain of Responsibility (Cadena de Responsabilidad) es un patrón conductual que permite desacoplar el emisor de una solicitud de su receptor al darle a múltiples objetos la oportunidad de manejar la solicitud. Esto se logra encadenando los objetos receptores entre sí y pasando la solicitud a lo largo de la cadena hasta que un objeto la maneje.
 
 Hay tres componentes principales en el patrón de Cadena de Responsabilidad:

    - Handler: Una clase abstracta o protocolo que define la interfaz para manejar solicitudes. También mantiene una referencia al siguiente manejador en la cadena.
    - Concrete Handler: Una clase que hereda del Handler y que implementa la lógica de manejo para una solicitud específica.
    - Client: La clase cliente que inicia la solicitud y la envía al primer manejador de la cadena.
 */

struct User {
    let name: String
}

struct Ticket {
    let id: Int
    let description: String
    let informant: User
    let currentWorker: User
    let isRefined: Bool
}

protocol TicketHandler: AnyObject {
    var nextHandler: TicketHandler? { get set }
    func handle(ticket: Ticket) -> Bool
}

class ProductOwner: TicketHandler {
    var nextHandler: TicketHandler?
    
    func handle(ticket: Ticket) -> Bool {
        if ticket.isRefined {
            print("El ticket \(ticket.id) esta listo para el desarollo")
            return true
        } else { 
            print("El ticket \(ticket.id) no esta listo para el desarollo, el PM debe refinar la tarea y mover el ticket a ready to develop")
            return nextHandler?.handle(ticket: ticket) ?? false
        }
    }
}

class ProyectManager: TicketHandler {
    var nextHandler: TicketHandler?
    
    func handle(ticket: Ticket) -> Bool {
        if !(ticket.description.isEmpty) {
            // Aqui se hacen cosas
            print("El ticket \(ticket.id) se ha refinado de urgencia y esta listo para el desarollo")
            return true
        } else {
            print("El ticket \(ticket.id) no esta listo para el desarollo")
            return false
        }
    }
}

let po = ProductOwner()
let pm = ProyectManager()

po.nextHandler = pm

let refinedTicket = Ticket(id: 123, description: "hay que hacer cosa", 
                           informant: User(name: "Señor"),
                           currentWorker: User(name: "Compi"),
                           isRefined: true)
let unrefinedTicket = Ticket(id: 321, 
                             description: "hay que hacer otra cosa",
                             informant: User(name: "Señora"),
                             currentWorker: User(name: "Compitruena"),
                             isRefined: false)
let undefinedTicket = Ticket(id: 666,
                             description: "",
                             informant: User(name: "??????"),
                             currentWorker: User(name: ""),
                             isRefined: false)

if !po.handle(ticket: refinedTicket) {
    print("Se saca de backlog")
}
print("--------------------------")
if !po.handle(ticket: unrefinedTicket) {
    print("Se saca de backlog")
}
print("--------------------------")
if !po.handle(ticket: undefinedTicket) {
    print("Se saca de backlog")
}

//: [Next](@next)
