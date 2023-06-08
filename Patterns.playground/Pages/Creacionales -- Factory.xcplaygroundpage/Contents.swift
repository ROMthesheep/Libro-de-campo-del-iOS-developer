//: [Previous](@previous)

import Foundation

/**
 Factory Method es un patrón de diseño creacional que proporciona una interfaz para crear objetos en una superclase, mientras permite a las subclases alterar el tipo de objetos que se crearán.
 
 Utiliza el Método Fábrica cuando no conozcas de antemano las dependencias y los tipos exactos de los objetos con los que deba funcionar tu código.
     El patrón Método Fábrica separa el código de construcción de producto del código que hace uso del producto. Por ello, es más fácil extender el código de construcción de producto de forma independiente al resto del código.
     Por ejemplo, para añadir un nuevo tipo de producto a la aplicación, sólo tendrás que crear una nueva subclase creadora y sobrescribir el Factory Method que contiene.
 
 Utiliza el Factory Method cuando quieras ofrecer a los usuarios de tu biblioteca o framework, una forma de extender sus componentes internos.
     La herencia es probablemente la forma más sencilla de extender el comportamiento por defecto de una biblioteca o un framework. Pero, ¿cómo reconoce el framework si debe utilizar tu subclase en lugar de un componente estándar?
     La solución es reducir el código que construye componentes en todo el framework a un único patrón Factory Method y permitir que cualquiera sobrescriba este método además de extender el propio componente.
     Veamos cómo funcionaría. Imagina que escribes una aplicación utilizando un framework de UI de código abierto. Tu aplicación debe tener botones redondos, pero el framework sólo proporciona botones cuadrados. Extiendes la clase estándar Botón con una maravillosa subclase BotónRedondo, pero ahora tienes que decirle a la clase principal FrameworkUI que utilice la nueva subclase de botón en lugar de la clase por defecto.
     Para conseguirlo, creamos una subclase UIConBotonesRedondos a partir de una clase base del framework y sobrescribimos su método crearBotón. Si bien este método devuelve objetos Botón en la clase base, haces que tu subclase devuelva objetos BotónRedondo. Ahora, utiliza la clase UIConBotonesRedondos en lugar de FrameworkUI. ¡Eso es todo!
 */

// Este protocolo nos dictara el comportamiento comun a todas las clases generadoras de sujeto, la clase base de nuestro output.
protocol Matriz {
    func creacion() -> Sujeto
    func funcionalidadExtra() -> String
}

// Extendemos la clase matriz y definimos de base el metodo de funcionalidad extra para que no nos lo exigan al implementar el protocolo mas adelante
extension Matriz {
    func funcionalidadExtra() -> String {
        let sujeto = creacion()
        return "Matriz: la funcionalidad de creacion funciona: \n\(sujeto.accion())"
    }
}

// Creamos las clases que van a implementar nuestra matriz
class Subsidiaria1: Matriz {
    func creacion() -> Sujeto {
        SujetoConreto1()
    }
}

class Subsidiaria2: Matriz {
    func creacion() -> Sujeto {
        SujetoConreto2()
    }
}

// Creamos el protocolo de nuestro output comun y sus clases que lo implementan
protocol Sujeto {
    func accion() -> String
}

class SujetoConreto1: Sujeto {
    func accion() -> String {
        "Sujeto 1: Hola! soy el sujeto 1, voy a realizar la accion solicitada por el cliente"
    }
}

class SujetoConreto2: Sujeto {
    func accion() -> String {
        "Sujeto 2: Hola! soy el sujeto 2, voy a realizar la accion solicitada por el cliente"
    }
}

// Creamos el cliente, la parte visible, que solicita a cualquier clase de tipo matriz una funcionalidad, el cliente no sabe quien de las clases que heredan de Matriz va a hacer el trabajo ni con que sujeto, lo unico que necesita es saber el objeto pasado por parametro es capaz de resolver la tarea
class Cliente {
    static func funcionDeCliente(matriz: Matriz) {
        print("Cliente: me da igual quien sea pero que me haga esto \(matriz.funcionalidadExtra())")
    }
}


// Demo
print("App: Lanzado desde Subsidiaria 1")
Cliente.funcionDeCliente(matriz: Subsidiaria1())
print("\nApp: Lanzado desde Subsidiaria 2")
Cliente.funcionDeCliente(matriz: Subsidiaria2())

//: [Next](@next)
