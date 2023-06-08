//: [Previous](@previous)

import Foundation

/**
 Prototype es un patrón de diseño creacional que nos permite copiar objetos existentes sin que el código dependa de sus clases.
 
 Utiliza el patrón Prototype cuando tu código no deba depender de las clases concretas de objetos que necesites copiar.
    Esto sucede a menudo cuando tu código funciona con objetos pasados por código de terceras personas a través de una interfaz. Las clases concretas de estos objetos son desconocidas y no podrías depender de ellas aunque quisieras.
    El patrón Prototype proporciona al código cliente una interfaz general para trabajar con todos los objetos que soportan la clonación. Esta interfaz hace que el código cliente sea independiente de las clases concretas de los objetos que clona.
 
 Utiliza el patrón cuando quieras reducir la cantidad de subclases que solo se diferencian en la forma en que inicializan sus respectivos objetos. Puede ser que alguien haya creado estas subclases para poder crear objetos con una configuración específica.
     El patrón Prototype te permite utilizar como prototipos un grupo de objetos prefabricados, configurados de maneras diferentes.
     En lugar de instanciar una subclase que coincida con una configuración, el cliente puede, sencillamente, buscar el prototipo adecuado y clonarlo.

 */

class Original: NSCopying, Equatable {
    private var intValue = Int()
    private var stringValue = String()
    
    required init(intValue: Int = 1, stringValue: String = "Value") {
        self.intValue = intValue
        self.stringValue = stringValue
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let prototype = type(of: self).init()
        prototype.intValue = intValue
        prototype.stringValue = stringValue
        print("valores clonados desde Original!")
        return prototype
    }
    
    /// MARK: - Equatable
    static func == (lhs: Original, rhs: Original) -> Bool {
        return lhs.intValue == rhs.intValue && lhs.stringValue == rhs.stringValue
    }
}

class OriginalAmpliado: Original {
    private var extraVariable = Bool()
    
    func copy() -> Any {
        return copy(with: nil)
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        guard let prototype = super.copy(with: zone) as? OriginalAmpliado else {
            return OriginalAmpliado() // Cagaste
        }
        prototype.extraVariable = extraVariable
        print("valores clonados desde OriginalAmpliado!")
        return prototype
    }
}

class Client {
    static func action() {
        let original = OriginalAmpliado(intValue: 16, stringValue: "Adolin")
        guard let copy = original.copy() as? OriginalAmpliado else {
            fatalError()
        }
        
        if original == copy {
            print("\nClase copiada con exito!\n")
            print("original:\n")
            dump(original)
            print("\ncopia:\n")
            dump(copy)
        }
    }
}

Client.action()
//: [Next](@next)
