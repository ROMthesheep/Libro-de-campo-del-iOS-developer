//: [Previous](@previous)

import Foundation

/**
 Utiliza el patrón Composite cuando tengas que implementar una estructura de objetos con forma de árbol.
    El patrón Composite te proporciona dos tipos de elementos básicos que comparten una interfaz común: hojas simples y contenedores complejos. Un contenedor puede estar compuesto por hojas y por otros contenedores. Esto te permite construir una estructura de objetos recursivos anidados parecida a un árbol.

 Utiliza el patrón cuando quieras que el código cliente trate elementos simples y complejos de la misma forma.
    Todos los elementos definidos por el patrón Composite comparten una interfaz común. Utilizando esta interfaz, el cliente no tiene que preocuparse por la clase concreta de los objetos con los que funciona.
 */

protocol Componente {
    var parent: Componente? { get set }
    
    func add(_ componente: Componente)
    func remove(_ componente: Componente)
    func isComposite() -> Bool
    func accion() -> String
}

extension Componente {
    func add(_ componente: Componente) {}
    func remove(_ componente: Componente) {}
    func isComposite() -> Bool { false }
}

class ComponenteFinal: Componente {
    var parent: Componente?
    
    func accion() -> String {
        "final"
    }
}

class ComponenteCompleto: Componente {
    var parent: Componente?
    private var children = [Componente]()
    
    func add(_ componente: Componente) {
        var item = componente
        item.parent = self
        children.append(item)
    }
    
    func remove(_ componente: Componente) {
        
    }
    
    func accion() -> String {
        "rama: \(children.map({ $0.accion() }).joined(separator: " "))"
    }
    
    func isComposite() -> Bool {
        true
    }
}

class Cliente {
    static func accion(componente: Componente) {
        print("Resultado: \(componente.accion())")
    }
    
    static func accionExtra(componentePrevio: Componente, componentePosterior: Componente) {
        if componentePrevio.isComposite() {
            componentePrevio.add(componentePosterior)
        }
        print("Resultado: \(componentePrevio.accion())")
    }
}

Cliente.accion(componente: ComponenteFinal())

let arbol = ComponenteCompleto()
let rama1 = ComponenteCompleto()
let rama2 = ComponenteCompleto()
let rama3 = ComponenteCompleto()
let rama21 = ComponenteCompleto()
rama1.add(ComponenteFinal())
rama21.add(ComponenteFinal())
rama2.add(rama21)
rama3.add(ComponenteFinal())

arbol.add(rama1)
arbol.add(rama2)
arbol.add(rama3)

Cliente.accion(componente: arbol)
Cliente.accionExtra(componentePrevio: arbol, componentePosterior: ComponenteFinal())

//: [Next](@next)
