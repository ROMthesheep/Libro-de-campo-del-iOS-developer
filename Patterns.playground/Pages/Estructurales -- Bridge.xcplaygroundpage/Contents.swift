//: [Previous](@previous)

import Foundation

/**
 Utiliza el patrón Bridge cuando quieras dividir y organizar una clase monolítica que tenga muchas variantes de una sola funcionalidad (por ejemplo, si la clase puede trabajar con diversos servidores de bases de datos).
    Conforme más crece una clase, más difícil resulta entender cómo funciona y más tiempo se tarda en realizar un cambio. Cambiar una de las variaciones de funcionalidad puede exigir realizar muchos cambios a toda la clase, lo que a menudo provoca que se cometan errores o no se aborden algunos de los efectos colaterales críticos.
    El patrón Bridge te permite dividir la clase monolítica en varias jerarquías de clase. Después, puedes cambiar las clases de cada jerarquía independientemente de las clases de las otras. Esta solución simplifica el mantenimiento del código y minimiza el riesgo de descomponer el código existente.

 Utiliza el patrón cuando necesites extender una clase en varias dimensiones ortogonales (independientes).
    El patrón Bridge sugiere que extraigas una jerarquía de clase separada para cada una de las dimensiones. La clase original delega el trabajo relacionado a los objetos pertenecientes a dichas jerarquías, en lugar de hacerlo todo por su cuenta.
 
 Utiliza el patrón Bridge cuando necesites poder cambiar implementaciones durante el tiempo de ejecución.
    Aunque es opcional, el patrón Bridge te permite sustituir el objeto de implementación dentro de la abstracción. Es tan sencillo como asignar un nuevo valor a un campo.
    Por cierto, este último punto es la razón principal por la que tanta gente confunde el patrón Bridge con el patrón Strategy. Recuerda que un patrón es algo más que un cierto modo de estructurar tus clases. También puede comunicar intención y el tipo de problema que se está abordando.


 */

class Abstraccion {
    fileprivate var implementacion: Implementacion
    
    init(_ implementacion: Implementacion) {
        self.implementacion = implementacion
    }
    
    func accion() -> String {
        "Abstraccion: accion con \(implementacion.accion())"
    }
}

class AbstraccionAmpliada: Abstraccion {
    override func accion() -> String {
        "AbstraccionAmpliada: accion ampliada con \(implementacion.accion())"
    }
}

protocol Implementacion {
    func accion() -> String
}

class ImplementacionConcretaA: Implementacion {
    func accion() -> String {
        "ImplementacionConcretaA: Resultado de la implementacion A"
    }
}

class ImplementacionConcretaB: Implementacion {
    func accion() -> String {
        "ImplementacionConcretaB: Resultado de la implementacion B"
    }
}

class Cliente {
    static func accion(abstraccion: Abstraccion) {
        print(abstraccion.accion())
    }
}

Cliente.accion(abstraccion: Abstraccion(ImplementacionConcretaA()))
Cliente.accion(abstraccion: Abstraccion(ImplementacionConcretaB()))

//: [Next](@next)
