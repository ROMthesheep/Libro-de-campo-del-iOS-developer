//: [Previous](@previous)

import Foundation

/**
 Singleton es un patrón de diseño creacional que nos permite asegurarnos de que una clase tenga una única instancia, a la vez que proporciona un punto de acceso global a dicha instancia.
 
 Utiliza el patrón Singleton cuando una clase de tu programa tan solo deba tener una instancia disponible para todos los clientes; por ejemplo, un único objeto de base de datos compartido por distintas partes del programa.
    El patrón Singleton deshabilita el resto de las maneras de crear objetos de una clase, excepto el método especial de creación. Este método crea un nuevo objeto, o bien devuelve uno existente si ya ha sido creado.

 Utiliza el patrón Singleton cuando necesites un control más estricto de las variables globales.
     Al contrario que las variables globales, el patrón Singleton garantiza que haya una única instancia de una clase. A excepción de la propia clase Singleton, nada puede sustituir la instancia en caché.
     Ten en cuenta que siempre podrás ajustar esta limitación y permitir la creación de cierto número de instancias Singleton. La única parte del código que requiere cambios es el cuerpo del método getInstance.

 */
class Singleton {
    static var shared: Singleton = {
        let instance = Singleton()
        
        return instance
    }()
    
    private init() {}
    
    func action() -> String {
        "Hi there! Im the singleton"
    }
}

class Cliente {
    static func action() {
        let instance1 = Singleton.shared
        let instance2 = Singleton.shared
        
        if instance1 === instance2 {
            print("El singueton funciona, ambas instancias son las mismas")
        } else {
            print("El singueton no funciona, hay algun fallo en la implementacion")
        }
    }
}

Cliente.action()
//: [Next](@next)
