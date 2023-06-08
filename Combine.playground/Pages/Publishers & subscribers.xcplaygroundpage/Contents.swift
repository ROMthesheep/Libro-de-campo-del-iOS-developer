import UIKit
import Combine

let myArray = ["1","2","3","4","5","6","7","8"]
let myPublisher = myArray.publisher

let just = Just(["1","2","3","4","5","6","7","8"])

// Sink:
myPublisher.sink(receiveCompletion: { isFinished in
    print("isFinished: \(isFinished)")
}, receiveValue: { value in
    print("Value emited: \(value)")
})

// Assign to:
class CounterClass {
    var counter: Int = Int()
}
let justInt = Just(42)
let myCounter = CounterClass()
justInt.assign(to: \CounterClass.counter, on: myCounter)

print(justInt)
myCounter.counter

// Cancelar subscripcion:

let cancellable = myPublisher.sink(receiveCompletion: { isFinished in
    isFinished
}, receiveValue: { value in
    value
})

cancellable.cancel()

//: [Next](@next)
