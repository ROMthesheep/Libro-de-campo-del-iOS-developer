//: [Previous](@previous)

/**
 El patron Memento es una herramienta poderosa para cuando estemos tratando con objetos que a lo largo de su vida util cambian de estado, el patron nos permite restaurar, almacenar y tener un control sobre los estados por los que pasa el objeto. Una buena analogia es una captura de pantalla, eso es un momento, una copia de una entidad en un momento concreto con una informacion concreta.
 Y todo esto se consigue sin romper el encapsulamiento a lo largo de la ejecucion.
 
 El patron se define en tres entidades bien diferenciadas
 - El memento
 - el cuidador (caretaker)
 - el origen (originator)
 
 Aunque en esta implementacion despreciaremos el origen haciendo el patron un poco mas ligero.
 
 Este patron es increiblemente poderoso en aplicaciones delicadas, donde un crash mal gestionado puede softlockear al usuario, mantener una ultima snapshot estable de la aplicacion puede salvar a una aplicacion de ese estilo.
 Este es un Patron con un abanico de aplicaciones muy extenso y combinarlo con userDefaults, swiftData o CoreData puede expandir su utilidad
 */

import Foundation

protocol Memento {
    var data: [String : Any] { get }
    init?(data: [String : Any])
}

protocol Caretaker {
    var states: [String: String] { get }
    mutating func save<T: Memento>(memento: T, for stateName: String)
    func restore<T: Memento>(state: String) -> T?
    mutating func delete(state: String)
}

// TODO: hay que ampliar aqui info sobre este wrapper
@dynamicMemberLookup
struct UserDefaultsCaretaker: Caretaker {
    subscript<T: Memento>(dynamicMember input: String) -> T? {
        restore(state: input)
    }
    
    private let defaults = UserDefaults.standard
    private static let STATES_KEY = "keys"
    
    var states: [String : String] = [:] {
        didSet {
            defaults.set(states, forKey: UserDefaultsCaretaker.STATES_KEY)
        }
    }
    
    init() {
        if let recoveredStates = defaults.object(forKey: UserDefaultsCaretaker.STATES_KEY) as? [String : String] {
            print("Valores restaurados: ", recoveredStates)
            states = recoveredStates
        }
    }
    
    mutating func save<T>(memento: T, for stateName: String) where T : Memento {
        states.updateValue(stateName, forKey: stateName)
        defaults.set(memento.data, forKey: stateName)
    }
    
    func restore<T>(state: String) -> T? where T : Memento {
        guard let data = defaults.object(forKey: state) as? [String: Any] else { return nil }
        return T(data: data)
    }
    
    mutating func delete(state: String) {
        states.removeValue(forKey: state)
        defaults.removeObject(forKey: state)
    }
}

final class User: Memento {
    var name: String
    var age: Int
    var address: String
    
    var data: [String: Any] {
        ["name": name, "age": age, "address": address]
    }
    
    init(name: String, age: Int, address: String) {
        self.name = name
        self.age = age
        self.address = address
    }
        
    required init?(data: [String : Any]) {
        guard let mName = data["name"] as? String, let mAge = data["age"] as? Int, let mAddress = data["address"] as? String else { return nil }
        name = mName
        age = mAge
        address = mAddress
    }
}

final class Animal: Memento {
    var name: String
    var age: Int
    var data: [String : Any] {
        ["name": name, "age": age]
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    required init?(data: [String : Any]) {
        guard let mName = data["name"] as? String, let mAge = data["age"] as? Int else { return nil }
        name = mName
        age = mAge
    }
}

var user = User(name: "Rom", age: 28, address: "calle falsa 123")
var animal = Animal(name: "Tulumi", age: 5)

var caretaker = UserDefaultsCaretaker()

caretaker.save(memento: user, for: "yo")
caretaker.save(memento: animal, for: "princesa")

user.age = 69
animal.age = 16

caretaker.save(memento: user, for: "niceUser")
caretaker.save(memento: animal, for: "princesaViejita")

user.name = "Bu"
animal.name = "Ramon"

print(user)
print(animal)


if let restoredUser = caretaker.yo as User? {
    print("Cargado desde el caretaker: ", restoredUser)
}

if let restoredUser = caretaker.niceUser as User? {
    print("Cargado desde el caretaker: ", restoredUser)
}

if let restoredAnimal = caretaker.princesa as Animal? {
    print("Cargado desde el caretaker: ", restoredAnimal)
}

if let restoredAnimal = caretaker.princesaViejita as Animal? {
    print("Cargado desde el caretaker: ", restoredAnimal)
}
//: [Next](@next)
