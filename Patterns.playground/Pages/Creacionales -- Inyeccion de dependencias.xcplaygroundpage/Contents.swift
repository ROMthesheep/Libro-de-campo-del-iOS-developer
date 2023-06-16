//: [Previous](@previous)

import Foundation

class DataStorage {
    var dataBase: Persistence
    
    init(dataBase: Persistence) {
        self.dataBase = dataBase
    }
}

enum TipoPersistencia {
    case queue
    case query
    case graph
}

protocol Serializable {
    func serializar() -> Serializable
}

protocol Persistence {
    var tipo: TipoPersistencia { get }
    
    init(tipo: TipoPersistencia)
    
    func guardar(seializable: Serializable)
    func carga(_ id: String, completion: @escaping (_ registro: Serializable) -> Void)
}

class DataBase: Persistence {
    var tipo: TipoPersistencia
    
    required init(tipo: TipoPersistencia) {
        self.tipo = tipo
    }
    
    func guardar(seializable: Serializable) {
        print(#function + " item guardado!")
    }
    
    func carga(_ id: String, completion: @escaping (Serializable) -> Void) {
        print(#function + " item con id \(id) guardado!")
    }
}

class OtroTipoDeDatos: Persistence {
    var tipo: TipoPersistencia
    
    required init(tipo: TipoPersistencia) {
        self.tipo = tipo
    }
    
    func guardar(seializable: Serializable) {
        print(#function + " item guardado!")
    }
    
    func carga(_ id: String, completion: @escaping (Serializable) -> Void) {
        print(#function + " item con id \(id) guardado!")
    }
}

let dataBase = DataBase(tipo: .graph)
let storage = DataStorage(dataBase: dataBase)

let otroTipoDeBaseDeDatos = OtroTipoDeDatos(tipo: .query)
storage.dataBase = otroTipoDeBaseDeDatos
//: [Next](@next)
