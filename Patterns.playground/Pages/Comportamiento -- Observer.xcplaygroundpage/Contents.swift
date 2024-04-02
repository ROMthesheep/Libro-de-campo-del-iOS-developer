//: [Previous](@previous)

import Foundation

protocol Hit: AnyObject {
    var dmg: Double { get }
}

protocol Observer: AnyObject {
    func notify(with hit: Hit)
}

class Player {
    private final class WeakObserver {
        weak var value: Observer?
        
        init(_ value: Observer) {
            self.value = value
        }
    }
    
    private var observers = [WeakObserver]()
    private var queue = DispatchQueue(label: "concurrent", attributes: .concurrent)
    
    public subscript(index: Int) -> Observer? {
        get {
            guard index > -1, index < observers.count else {
                return nil
            }
            return observers[index].value
        }
    }
    
    public subscript(observer: Observer) -> Int? {
        get {
            guard let index = observers.firstIndex(where: { $0.value === observer }) else {
                return nil
            }
            return index
        }
    }
    
    // API time
    
    func add(observer: Observer) {
        queue.sync(flags: .barrier) {
            self.observers.append(WeakObserver(observer))
        }
    }
    
    func remove(observer: Observer) {
        queue.sync(flags: .barrier) {
            guard let index = self[observer] else {
                return
            }
            observers.remove(at: index)
        }
    }
    
    func send(hit: Hit) {
        recycle()
        for observer in observers {
            observer.value?.notify(with: hit)
        }
    }
    
    func dispose(observer: Observer) {
        queue.sync(flags: .barrier) {
            if let index = self[observer] {
                observers[index].value = nil
            }
        }
    }
    
    private func recycle() {
        for (index, element) in observers.enumerated().reversed() where element.value == nil {
            observers.remove(at: index)
        }
    }
}

infix operator --=

infix operator -=


extension Player {
    static func +=(lhs: Player, rhs: Observer) {
        lhs.add(observer: rhs)
    }
    
    static func +=(lhs: Player, rhs: [Observer]) {
        rhs.forEach { lhs.add(observer: $0) }
    }
    
    static func --=(lhs: Player, rhs: Observer) {
        lhs.remove(observer: rhs)
    }
    
    static func --=(lhs: Player, rhs: [Observer]) {
        rhs.forEach { lhs.remove(observer: $0) }
    }
    
    static func -=(lhs: Player, rhs: Observer) {
        lhs.dispose(observer: rhs)
    }
    
    static func -=(lhs: Player, rhs: [Observer]) {
        rhs.forEach { lhs.dispose(observer: $0) }
    }
    
    static func ~>(lhs: Player, rhs: Hit) {
        lhs.send(hit: rhs)
    }
    
    static func ~>(lhs: Player, rhs: [Hit]) {
        rhs.forEach { lhs.send(hit: $0) }
    }
}



//: [Next](@next)
