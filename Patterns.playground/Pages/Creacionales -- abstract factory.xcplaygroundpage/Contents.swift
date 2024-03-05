//: [Previous](@previous)

import Foundation

/**
 Abstract Factory es un patrón de diseño creacional que nos permite producir familias de objetos relacionados sin especificar sus clases concretas.
 
 Utiliza el patrón Abstract Factory cuando tu código deba funcionar con varias familias de productos relacionados, pero no desees que dependa de las clases concretas de esos productos, ya que puede ser que no los conozcas de antemano o sencillamente quieras permitir una futura extensibilidad.
    El patrón Abstract Factory nos ofrece una interfaz para crear objetos a partir de cada clase de la familia de productos. Mientras tu código cree objetos a través de esta interfaz, no tendrás que preocuparte por crear la variante errónea de un producto que no combine con los productos que ya ha creado tu aplicación.

 Considera la implementación del patrón Abstract Factory cuando tengas una clase con un grupo de métodos de fábrica que nublen su responsabilidad principal.
    En un programa bien diseñado cada clase es responsable tan solo de una cosa. Cuando una clase lidia con varios tipos de productos, puede ser que valga la pena extraer sus métodos de fábrica para ponerlos en una clase única de fábrica o una implementación completa del patrón Abstract Factory.

 */

protocol AbstractFactory {
    func crearProductoA() -> AbstractProductA
    func crearProductoB() -> AbstractProductB
}

class ConcreteteFactory1: AbstractFactory {
    func crearProductoA() -> AbstractProductA {
        ConcreteProductA1()
    }
    
    func crearProductoB() -> AbstractProductB {
        ConcreteProductB1()
    }
    
    
}

class ConcreteteFactory2: AbstractFactory {
    func crearProductoA() -> AbstractProductA {
        ConcreteProductA2()
    }
    
    func crearProductoB() -> AbstractProductB {
        ConcreteProductB2()
    }
    
    
}

protocol AbstractProductA {
    func accion() -> String
}

class ConcreteProductA1: AbstractProductA {
    func accion() -> String {
        "Accion de A1"
    }
}

class ConcreteProductA2: AbstractProductA {
    func accion() -> String {
        "Accion de A2"
    }
}

protocol AbstractProductB {
    func accion() -> String
    func extraAccion(_ extraProduct: AbstractProductA) -> String
}

class ConcreteProductB1: AbstractProductB {
    func extraAccion(_ extraProduct: AbstractProductA) -> String {
        "Accion de B con \(extraProduct.accion())"
    }
    
    func accion() -> String {
        "Accion de B1"
    }
}

class ConcreteProductB2: AbstractProductB {
    func extraAccion(_ extraProduct: AbstractProductA) -> String {
        "Accion de B con \(extraProduct.accion())"
    }
    
    func accion() -> String {
        "Accion de B2"
    }
}

class Cliente {
    static func peticion(factory: AbstractFactory) {
        let productoA = factory.crearProductoA()
        let productoB = factory.crearProductoB()
        
        print(productoB.accion())
        print(productoB.extraAccion(productoA))
    }
}

print("Cliente: haciendo peticion a la fabrica 1")
Cliente.peticion(factory: ConcreteteFactory1())
print("\nCliente: haciendo peticion a la fabrica 2")
Cliente.peticion(factory: ConcreteteFactory2())


//: [Next](@next)
