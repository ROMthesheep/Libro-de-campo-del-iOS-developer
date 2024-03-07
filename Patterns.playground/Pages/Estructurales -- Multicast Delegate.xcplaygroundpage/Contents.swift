//: [Previous](@previous)

import Foundation

// TODO: encontrar un mejor ejemplo

/**
 El patrón Multicast Delegate es un patrón de diseño multipropósito (a pesar de que está categorizado aquí como estructural) que extiende aún más las capacidades del patrón Delegate. El patrón Delegate establece una relación uno a uno entre el delegado y los tipos delegados. El patrón Multicast Delegate permite que múltiples delegados se adjunten a un tipo delegado manteniendo una colección de objetos referenciados de manera débil.
 */
final class Weak {
    
    // MARK: - Properties
    
    weak var value: AnyObject?
    
    // MARK: - Initializers
    
    init(_ value: AnyObject) {
        self.value = value
    }
}

class MulticastDelegate<T> {
    public subscript(index: Int) -> T? {
        get {
            guard index > -1, index < delegates.count else {
                return nil
            }
            return delegates[index].value as? T
        }
    }

    public subscript(delegate: T) -> Int? {
        get {
            guard let index = delegates.firstIndex(where: { $0.value  === delegate as AnyObject }) else {
                return nil
            }
            return index
        }
    }
    
    private var delegates = [Weak]()
    
    // MARK: - Methods
    
    public func add(delegate: T) {
        delegates.append(Weak(delegate as AnyObject))
    }
    
    public func remove(delegate: T) {
        guard let index = self[delegate] else {
            return
        }
        delegates.remove(at: index)
    }
    
    public func update(_ completion: @escaping(T) -> ()) {
        recycle()
        
        delegates.forEach { delegate in
            if let udelegate = delegate.value as? T {
                completion(udelegate)
            }
        }
    }
    
    // MARK: - Private
    
    private func recycle() {
        for (index, element) in delegates.enumerated().reversed() where element.value == nil {
            delegates.remove(at: index)
        }
    }
    
}

protocol ModelDelegate: AnyObject {
    func didUpdate(name: String)
    func didUpdate(city: String)
    func didSave()
}

class ProfileModel {
    var delegates = MulticastDelegate<ModelDelegate>()
    
    var name: String = UUID.init().uuidString {
        didSet {
            delegates.update { [unowned self] modelDelegate in
                modelDelegate.didUpdate(name: self.name)
            }
        }
    }
    
    var city: String = UUID.init().uuidString {
        didSet {
            delegates.update { [unowned self] modelDelegate in
                modelDelegate.didUpdate(city: self.city)
            }
        }
    }
    
    func completedUpdate() {
        delegates.update { modelDelegate in
            modelDelegate.didSave()
        }
    }
}

//: [Next](@next)
