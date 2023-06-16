//: [Previous](@previous)

import Foundation

/**
 Utiliza el patrón Facade cuando necesites una interfaz limitada pero directa a un subsistema complejo.
    A menudo los subsistemas se vuelven más complejos con el tiempo. Incluso la aplicación de patrones de diseño suele conducir a la creación de un mayor número de clases. Un subsistema puede hacerse más flexible y más fácil de reutilizar en varios contextos, pero la cantidad de código de configuración que exige de un cliente, crece aún más. El patrón Facade intenta solucionar este problema proporcionando un atajo a las funciones más utilizadas del subsistema que mejor encajan con los requisitos del cliente.

 Utiliza el patrón Facade cuando quieras estructurar un subsistema en capas.
    Crea fachadas para definir puntos de entrada a cada nivel de un subsistema. Puedes reducir el acoplamiento entre varios subsistemas exigiéndoles que se comuniquen únicamente mediante fachadas.
    Por ejemplo, regresemos a nuestro framework de conversión de vídeo. Puede dividirse en dos capas: la relacionada con el vídeo y la relacionada con el audio. Puedes crear una fachada para cada capa y hacer que las clases de cada una de ellas se comuniquen entre sí a través de esas fachadas. Este procedimiento es bastante similar al patrón Mediator.
 */

class Facade {
    private var subSistemaA: SubSistemaA
    private var subSistemaB: SubSistemaB
    
    init(subSistemaA: SubSistemaA = SubSistemaA(), subSistemaB: SubSistemaB = SubSistemaB()) {
        self.subSistemaA = subSistemaA
        self.subSistemaB = subSistemaB
    }
    
    func accion() -> String {
            var result = "Facade:"
            result += " " + subSistemaA.accion()
            result += " " + subSistemaB.accion()
            result += " " + subSistemaA.otraAccion()
            result += " " + subSistemaB.otraAccion()
            return result
        }
}

class SubSistemaA {
    func accion() -> String {
        "primera accion del subsistema A"
    }
    
    func otraAccion() -> String {
        "segunda accion del subsistema A"
    }
}

class SubSistemaB {
    func accion() -> String {
        "primera accion del subsistema B"
    }
    
    func otraAccion() -> String {
        "segunda accion del subsistema B"
    }
}

class Cliente {
    // ...
    static func accion(facade: Facade) {
        print(facade.accion())
    }
    // ...
}

Cliente.accion(facade: Facade())

//: [Next](@next)
