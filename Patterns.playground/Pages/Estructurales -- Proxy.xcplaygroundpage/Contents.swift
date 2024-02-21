//: [Previous](@previous)

import Foundation

/**
 Inicialización diferida (proxy virtual). Es cuando tienes un objeto de servicio muy pesado que utiliza muchos recursos del sistema al estar siempre funcionando, aunque solo lo necesites de vez en cuando.
    En lugar de crear el objeto cuando se lanza la aplicación, puedes retrasar la inicialización del objeto a un momento en que sea realmente necesario.

Control de acceso (proxy de protección). Es cuando quieres que únicamente clientes específicos sean capaces de utilizar el objeto de servicio, por ejemplo, cuando tus objetos son partes fundamentales de un sistema operativo y los clientes son varias aplicaciones lanzadas (incluyendo maliciosas).
    El proxy puede pasar la solicitud al objeto de servicio tan sólo si las credenciales del cliente cumplen ciertos criterios.

Ejecución local de un servicio remoto (proxy remoto). Es cuando el objeto de servicio se ubica en un servidor remoto.
    En este caso, el proxy pasa la solicitud del cliente por la red, gestionando todos los detalles desagradables de trabajar con la red.

Solicitudes de registro (proxy de registro). Es cuando quieres mantener un historial de solicitudes al objeto de servicio.
    El proxy puede registrar cada solicitud antes de pasarla al servicio.

Resultados de solicitudes en caché (proxy de caché). Es cuando necesitas guardar en caché resultados de solicitudes de clientes y gestionar el ciclo de vida de ese caché, especialmente si los resultados son muchos.
    El proxy puede implementar el caché para solicitudes recurrentes que siempre dan los mismos resultados. El proxy puede utilizar los parámetros de las solicitudes como claves de caché.

Referencia inteligente. Es cuando debes ser capaz de desechar un objeto pesado una vez que no haya clientes que lo utilicen.
    El proxy puede rastrear los clientes que obtuvieron una referencia del objeto de servicio o sus resultados. De vez en cuando, el proxy puede recorrer los clientes y comprobar si siguen activos. Si la lista del cliente se vacía, el proxy puede desechar el objeto de servicio y liberar los recursos subyacentes del sistema.
    El proxy también puede rastrear si el cliente ha modificado el objeto de servicio. Después, los objetos sin cambios pueden ser reutilizados por otros clientes.

 */

protocol Sujeto {
    func accion()
}

class SujetoReal: Sujeto {
    func accion() {
        print("Accion realizada en el sujeto real")
    }
}

class Proxy: Sujeto {
    private var sujetoReal: SujetoReal
    
    init(_ sujetoReal: SujetoReal) {
        self.sujetoReal = sujetoReal
    }
    
    func accion() {
        if permitido() {
            sujetoReal.accion()
        } else {
            fakeAccion()
        }
    }
    
    private func permitido() -> Bool {
        // Aqui deberian hacerse checkeos de si deberia acceder al sujeto real y en funcion de eso devolver una cosa u otra
        return [true,false].randomElement()!
    }
    
    private func fakeAccion() {
        print("Accion realizada en el proxy")
    }
}

class Cliente {
    static func accion(sujeto: Sujeto) {
        sujeto.accion()
    }
}

Cliente.accion(sujeto: SujetoReal())
Cliente.accion(sujeto: Proxy(SujetoReal()))

//: [Next](@next)
