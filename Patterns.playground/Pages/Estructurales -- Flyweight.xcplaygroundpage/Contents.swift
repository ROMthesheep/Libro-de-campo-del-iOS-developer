//: [Previous](@previous)

import Foundation

/**
 Utiliza el patrón Flyweight únicamente cuando tu programa deba soportar una enorme cantidad de objetos que apenas quepan en la RAM disponible.
    La ventaja de aplicar el patrón depende en gran medida de cómo y dónde se utiliza. Resulta más útil cuando:
    - la aplicación necesita generar una cantidad enorme de objetos similares
    - esto consume toda la RAM disponible de un dispositivo objetivo
    - los objetos contienen estados duplicados que se pueden extraer y compartir entre varios objetos
 */

class Flyweight {
    private let estadoCompartido: [String]
    
    init(estadoCompartido: [String]) {
        self.estadoCompartido = estadoCompartido
    }
    
    func accion(estado: [String]) {
        print("Flyweight: mostrando \(estadoCompartido) compartido y \(estado) concreto")
    }
}

class FlyweightFactory {
    private var flyweights: [String: Flyweight]
    
    init(estados: [[String]]) {
        var flyweights = [String: Flyweight]()
        for estado in estados {
            flyweights[estado.key] = Flyweight(estadoCompartido: estado)
        }
        self.flyweights = flyweights
    }
    
    func flyweight(for estado: [String]) -> Flyweight {
        let key = estado.key
        guard let myFlyweight = flyweights[key] else {
            print("Fallo al encontrar flyweight")
            let flyweight = Flyweight(estadoCompartido: estado)
            flyweights.updateValue(flyweight, forKey: key)
            return flyweight
        }
        print("FlyweightFactory: reutilizando objeto existente")
        return myFlyweight
    }
    
    func printFlyweights() {
        print("FlyweightFactory: Tengo \(flyweights.count) flyweights:")
        for item in flyweights {
            print(item.key)
        }
    }
}

extension Array where Element == String {

    var key: String {
        return self.joined(separator: " ")
    }
}

func addCar(
       _ factory: FlyweightFactory,
       _ plates: String,
       _ owner: String,
       _ brand: String,
       _ model: String,
       _ color: String) {

   print("Client: Adding a car to database.\n")

   let flyweight = factory.flyweight(for: [brand, model, color])

   flyweight.accion(estado: [plates, owner])
}


let fabrica = FlyweightFactory(estados:
    [
        ["A","B","C","D","E"],
        ["1","2","3","4","5","6","7"],
        ["😀","😃","😄","😁"],
        ["🩷","❤️","🧡","💛","💚"],
        ["uno","dos","tres"]
    ])

fabrica.printFlyweights()

addCar(fabrica,
               "CL234IR",
               "James Doe",
               "BMW",
               "M5",
               "red")

addCar(fabrica,
               "CL234IR",
               "James Doe",
               "BMW",
               "X1",
               "red")

fabrica.printFlyweights()

//: [Next](@next)
