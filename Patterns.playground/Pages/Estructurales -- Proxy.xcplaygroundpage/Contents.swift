//: [Previous](@previous)

import Foundation

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
