//: [Previous](@previous)

import Foundation

/**
 Utiliza el patrón Decorator cuando necesites asignar funcionalidades adicionales a objetos durante el tiempo de ejecución sin descomponer el código que utiliza esos objetos.
    El patrón Decorator te permite estructurar tu lógica de negocio en capas, crear un decorador para cada capa y componer objetos con varias combinaciones de esta lógica, durante el tiempo de ejecución. El código cliente puede tratar a todos estos objetos de la misma forma, ya que todos siguen una interfaz común.

 Utiliza el patrón cuando resulte extraño o no sea posible extender el comportamiento de un objeto utilizando la herencia.
    Muchos lenguajes de programación cuentan con la palabra clave final que puede utilizarse para evitar que una clase siga extendiéndose. Para una clase final, la única forma de reutilizar el comportamiento existente será envolver la clase con tu propio wrapper, utilizando el patrón Decorator.

 */

protocol Componente {
    func accion() -> String
}

class ComponenteConcreto: Componente {
    func accion() -> String {
        "accion del componente concreto"
    }
}

class Decorator: Componente {
    private var componente: Componente
    
    init(_ componente: Componente) {
        self.componente = componente
    }
    
    func accion() -> String {
        componente.accion()
    }
}

class DecoradorConcretoA: Decorator {
    override func accion() -> String {
        "DecoradorConcretoA(\(super.accion()))"
    }
}

class DecoradorConcretoB: Decorator {
    override func accion() -> String {
        "DecoradorConcretoB(\(super.accion()))"
    }
}

class Cliente {
    static func accion(componente: Componente) {
        print("Resultado: \(componente.accion())")
    }
}

let simple = ComponenteConcreto()
let decorador1 = DecoradorConcretoA(simple)
let decorador2 = DecoradorConcretoB(decorador1)

Cliente.accion(componente: simple)
Cliente.accion(componente: decorador2)

//: [Next](@next)
