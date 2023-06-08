//: [Previous](@previous)

import Combine
import UIKit

/*:
# Cancellation
A subscription returns a `Cancellable` object
Cualquier subscripcion retorna un objeto 'Cancellable'

La correcta gesion de memoria usando 'Cancellable' se asegura que no estamos reteniendo referencias innecesarias
*/

class MyClass {
    var cancellable: AnyCancellable? = nil
    var variable: Int = 0 {
        didSet {
            print("MyClass object.variable = \(variable)")
        }
    }

    init(subject: PassthroughSubject<Int,Never>) {
        cancellable = subject.sink { value in
            // metemos a posta un retain cycle dentro de la instancia del objeto
            self.variable += value
        }
    }

    deinit {
        print("MyClass object deallocated")
    }
}

func emitNextValue(from values: [Int], after delay: TimeInterval) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        var array = values
        subject.send(array.removeFirst())
        if !array.isEmpty {
            emitNextValue(from: array, after: delay)
        }
    }
}

let subject = PassthroughSubject<Int,Never>()
var object: MyClass? = MyClass(subject: subject)

emitNextValue(from: [1,2,3,4,5,6,7,8,9,10], after: 0.5)

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print("Nullify object")
    //: **TODO** descomenta la siguiente linea para ver que ocurre
    //Para el momento en se ejecuta esto, las refencias se borran de memoria ya que hemos destruido el contenedor donde se almacenaba la instancia del publiser anycancellable
//    object?.cancellable = nil
    object = nil
}

//: [Next](@next)
