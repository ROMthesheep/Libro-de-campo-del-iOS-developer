//: [Previous](@previous)

import Foundation

protocol ObjectPoolItem {
    var canBeReused: Bool { get }
    func reset()
}

class ObjectPool<T: ObjectPoolItem> {
    enum Poolstate {
        case drained(size: Int)
        case deflated(size: Int)
        case full(size: Int)
        case undefined
    }
    
    enum ItemState {
        case reused
        case rejected
    }
    
    private var objects = [T]()
    private var semaphore: DispatchSemaphore
    private var queue = DispatchQueue(label: "objectPool.concurrent", attributes: .concurrent)
    
    private  var size: Int = Int()
    
    var state: Poolstate {
        var state: Poolstate = .undefined
        let currentSize = objects.count
        if objects.isEmpty {
            state = .drained(size: size)
        } else if currentSize == size {
            state = .full(size: size)
        } else if currentSize < size, !objects.isEmpty {
            state = .deflated(size: currentSize)
        }
        return state
    }
    
    init(objects: [T]) {
        self.objects.reserveCapacity(objects.count)
        semaphore = DispatchSemaphore(value: objects.count)
        
        self.objects += objects
        size = objects.count
    }
    
    convenience init(objects: T...) {
        self.init(objects: objects)
    }
    
    deinit {
        for _ in 0..<objects.count {
            semaphore.signal()
        }
    }
    
    func enqueue(object: T, shouldResetState: Bool = false, completion: ((ItemState) -> ())? = nil) {
        queue.sync(flags: .barrier) {
            var itemState = ItemState.rejected
            
            if object.canBeReused, objects.count < size {
                if shouldResetState {
                    object.reset()
                }
                self.objects.append(object)
                self.semaphore.signal()
            }
            completion?(itemState)
        }
    }
    
    func dequeue() -> T? {
        var result: T?
        
        if semaphore.wait(timeout: .distantFuture) == .success {
            queue.sync(flags: .barrier) {
                result = objects.removeFirst()
            }
        }
        return result
    }
    
    func dequeueAll() -> [T] {
        var result = [T]()
        if semaphore.wait(timeout: .distantFuture) == .success {
            queue.sync(flags: .barrier) {
                result = Array(objects)
                objects.removeAll(keepingCapacity: true)
            }
        }
        return result
    }
    
    func eraseAll() {
        if semaphore.wait(timeout: .distantFuture) == .success {
            queue.sync(flags: .barrier) {
                objects.removeAll(keepingCapacity: true)
            }
        }
    }
}


class Resource: ObjectPoolItem, CustomStringConvertible {
    
    // MARK: - Properties
    
    var value: Int
    private let _value: Int
    
    // MARK: - Initializers
    
    init(value: Int) {
        self.value = value
        self._value = value
    }
    
    // MARK: - Conformance to CustomStringConvertible prtocol
    
    var description: String {
        return "\(value)"
    }
    
    // MARK: - Conformance to ObjectPoolItem protocol
    
    var canBeReused: Bool {
        return true
    }
    
    func reset() {
        value = _value
    }
    
}

let resourceOne = Resource(value: 1)
let resourceTwo = Resource(value: 2)
let resourceThree = Resource(value: 3)

// cuando se inicializa la pool la pool adquiere un tamaño y un estado.
let objectPool = ObjectPool<Resource>(objects: resourceOne, resourceTwo, resourceThree, resourceOne, resourceTwo, resourceThree, resourceOne, resourceTwo, resourceThree)
print("pool state: ", objectPool.state as Any)

print("Vamos a extraer un objeto, esto funciona como una pila a la inversa, siempre retirmaos el primero")
let poolObject = objectPool.dequeue()
print("pooled object: ", poolObject?.value as Any)

print("pool state: ", objectPool.state as Any)

poolObject?.value = 5
objectPool.enqueue(object: poolObject!) {
    switch $0 {
    case .reused:
        print("Item was reused by the pool")
    case .rejected:
        print("Item was reject by the pool")
    }
}

print("pool state: ", objectPool.state)
print("\n")
//: [Next](@next)
