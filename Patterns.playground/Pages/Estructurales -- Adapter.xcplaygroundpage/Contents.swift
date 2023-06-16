//: [Previous](@previous)

import Foundation

/**
 Utiliza la clase adaptadora cuando quieras usar una clase existente, pero cuya interfaz no sea compatible con el resto del código.
    El patrón Adapter te permite crear una clase intermedia que sirva como traductora entre tu código y una clase heredada, una clase de un tercero o cualquier otra clase con una interfaz extraña.
 Utiliza el patrón cuando quieras reutilizar varias subclases existentes que carezcan de alguna funcionalidad común que no pueda añadirse a la superclase.
    Puedes extender cada subclase y colocar la funcionalidad que falta, dentro de las nuevas clases hijas. No obstante, deberás duplicar el código en todas estas nuevas clases, lo cual huele muy mal.
    Una solución mucho más elegante sería colocar la funcionalidad que falta dentro de una clase adaptadora. Después puedes envolver objetos a los que les falten funciones, dentro de la clase adaptadora, obteniendo esas funciones necesarias de un modo dinámico. Para que esto funcione, las clases en cuestión deben tener una interfaz común y el campo de la clase adaptadora debe seguir dicha interfaz. Este procedimiento es muy similar al del patrón Decorator.

 */

class Objetivo {
    func accion() -> String {
        "Objectivo: comportamiento del objetivo"
    }
}

class AAdaptar {
    public func accionEspeficica() -> String {
        "ovitejbo led otneimatropmoc :ovitcejbO"
    }
}

class Adapter: Objetivo {
    private var aAdaptar: AAdaptar
    
    init(_ aAdaptar: AAdaptar) {
        self.aAdaptar = aAdaptar
    }
    
    override func accion() -> String {
        "Adaptador: " + aAdaptar.accionEspeficica().reversed()
    }
}

class Cliente {
    static func accion(objetivo: Objetivo) {
        print(objetivo.accion())
    }
}

Cliente.accion(objetivo: Objetivo())

let aAdaptar = AAdaptar()

print("A adaptar: \(aAdaptar.accionEspeficica())")
Cliente.accion(objetivo: Adapter(aAdaptar))
//: [Next](@next)
