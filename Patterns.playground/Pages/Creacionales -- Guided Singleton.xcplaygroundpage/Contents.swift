//: [Previous](@previous)

import Foundation

/**
 El singleton guiado es una variante del Singleton donde para acceder a los metodos relevantes del singleton obligamos al cliente a pasar por una serie de metodos, pudiendo hacer alli operaciones o comprobaciones.
 
 Utiliza el patrón Singleton guiado cuando una clase de tu programa tan solo deba tener una instancia disponible para todos los clientes y en todos los casos que se vaya a utilizar necesitas comprobar las mismas condiciones; por ejemplo, cruzar una aduana, si quieres pasar necesitas pasar por distintos checkeos.
    El patrón Singleton guiado al igual que el singleton deshabilita el resto de las maneras de crear objetos de una clase, excepto el método especial de creación. Este método crea un nuevo objeto, o bien devuelve uno existente si ya ha sido creado.
 */
protocol Id {
    func idAction() -> Name
}

protocol Name {
    func nameAction() -> ProcessHandler
    func surnameAction() -> ProcessHandler
    func aliasAction() -> Id
}

class ProcessHandler: Id, Name {
    
    static var shared: Id = ProcessHandler()
    
    private init() {}
    
    func idAction() -> Name {
        print("Estas obligado a pasar por aqui")
        return self
    }
    
    func nameAction() -> ProcessHandler {
        print("y por aqui tmbn estas obligado")
        return self
    }
    
    func surnameAction() -> ProcessHandler {
        return self
    }
    
    func aliasAction() -> Id {
        print("Estas obligado a pasar por aqui")
        return self
    }
    
    func action() {
        print("Done!")
    }
    
    func actionExtra() {
        print("Done extra action!")
    }
}

ProcessHandler.shared.idAction().nameAction().action()
ProcessHandler.shared.idAction().nameAction().actionExtra()
ProcessHandler.shared.idAction().surnameAction().action()
ProcessHandler.shared.idAction().aliasAction().idAction().nameAction().action()

//: [Next](@next)
