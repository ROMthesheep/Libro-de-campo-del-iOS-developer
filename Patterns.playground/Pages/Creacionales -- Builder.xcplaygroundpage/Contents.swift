//: [Previous](@previous)

import Foundation

/**
 Builder es un patrón de diseño creacional que nos permite construir objetos complejos paso a paso. El patrón nos permite producir distintos tipos y representaciones de un objeto empleando el mismo código de construcción.
 
 Utiliza el patrón Builder para evitar un “constructor telescópico”.
    Digamos que tenemos un constructor con diez parámetros opcionales. Invocar a semejante bestia es poco práctico, por lo que sobrecargamos el constructor y creamos varias versiones más cortas con menos parámetros. Estos constructores siguen recurriendo al principal, pasando algunos valores por defecto a cualquier parámetro omitido.
    El patrón Builder permite construir objetos paso a paso, utilizando tan solo aquellos pasos que realmente necesitamos. Una vez implementado el patrón, ya no hará falta apiñar decenas de parámetros dentro de los constructores.
 
 Utiliza el patrón Builder cuando quieras que el código sea capaz de crear distintas representaciones de ciertos productos (por ejemplo, casas de piedra y madera).
     El patrón Builder se puede aplicar cuando la construcción de varias representaciones de un producto requiera de pasos similares que sólo varían en los detalles.
     La interfaz constructora base define todos los pasos de construcción posibles, mientras que los constructores concretos implementan estos pasos para construir representaciones particulares del producto. Entre tanto, la clase directora guía el orden de la construcción.
 
 Utiliza el patrón Builder para construir árboles con el patrón Composite u otros objetos complejos.
     El patrón Builder te permite construir productos paso a paso. Podrás aplazar la ejecución de ciertos pasos sin descomponer el producto final. Puedes incluso invocar pasos de forma recursiva, lo cual resulta útil cuando necesitas construir un árbol de objetos.
     Un constructor no expone el producto incompleto mientras ejecuta los pasos de construcción. Esto evita que el código cliente extraiga un resultado incompleto.


 */

protocol Builder {
    func primerPaso()
    func segundoPaso()
    func ultimoPaso()
}

class ConcreteBuilder: Builder {
    
    private var sujeto = Sujeto()
    
    func reset() {
        sujeto = Sujeto()
    }
    
    func primerPaso() {
        sujeto.add("Parte 1")
    }
    
    func segundoPaso() {
        sujeto.add("Parte 2")
    }
    
    func ultimoPaso() {
        sujeto.add("Parte 3")
    }
    
    func entrega() -> Sujeto {
        let entregable = sujeto
        reset()
        return entregable
    }
}

class Sujeto {
    private var partes = [String]()
    func add(_ part: String) {
        partes.append(part)
    }
    
    func consultarPartes() -> String {
        "partes del producto: \(partes.joined(separator: ", "))\n"
    }
}

class Ensamblador {
    private var builder: Builder?
    
    func update(builder: Builder) {
        self.builder = builder
    }
    
    func creaVersionMinima() {
        builder?.primerPaso()
    }
    
    func creaVersionCompleta() {
        builder?.primerPaso()
        builder?.segundoPaso()
        builder?.ultimoPaso()
    }
    
    
}

class Cliente {
    static func peticion(ensamblador: Ensamblador) {
        let builder = ConcreteBuilder()
        ensamblador.update(builder: builder)
        
        print("Producto basico: ")
        ensamblador.creaVersionMinima()
        print(builder.entrega().consultarPartes())
        
        print("Producto completo: ")
        ensamblador.creaVersionCompleta()
        print(builder.entrega().consultarPartes())
    }
}

Cliente.peticion(ensamblador: Ensamblador())

//: [Next](@next)
