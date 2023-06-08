//: [Previous](@previous)

import Foundation
import Combine

/*:
# Scheduling operators
- Combine introdujo el protocolo `Scheduler`
- ... implementado por `DispatchQueue`, `RunLoop` y otros
- ... Te permite determinar el contexto de ejecucion para la subscripcion y recepcion de valores
- ... Te permite determinar el contexto de ejecucion para la subscripcion y recepcion de valores

- ... La principal diferendia entre estos dos metodos que veremos a continuacion es que recive(on:) afecta el contexto de ejecucion de los mensajes en su recepcion, mientras que subscribe(on:) afecta el contexto de ejecucion a la hora de su envio.
*/
let firstStepDone = DispatchSemaphore(value: 0)

/*:
## `receive(on:)`
- determina en que scheduler iran los datos emitidos por el siguiente operador y siguientes
- usado junto a 'DispatchQueue' te permite controlar en que cola de valores seran entregados los valores
*/

print("* Demonstrating receive(on:)")

let publisher = PassthroughSubject<String, Never>()
let receivingQueue = DispatchQueue(label: "receiving-queue")
let subscription = publisher
    .receive(on: receivingQueue)
    .sink { value in
        print("Received value: \(value) on thread \(Thread.current)")
        if value == "Four" {
            firstStepDone.signal()
        }
}

for string in ["One","Two","Three","Four"] {
    DispatchQueue.global().async {
        publisher.send(string)
    }
}

firstStepDone.wait()

/*:
## `subscribe(on:)`
- Determina en que scheduler sucede la subscripcion
- Util para controlar en que scheduler empieza el trabajo
- puede afectar a la cola en la que los valores estan siendo entregados
*/

print("\n* Demonstrating subscribe(on:)")
let subscription2 = [1,2,3,4,5].publisher
    .subscribe(on: DispatchQueue.global())
    .handleEvents(receiveOutput: { value in
        print("Value \(value) emitted on thread \(Thread.current)")
    })
    .receive(on: receivingQueue)
    .sink { value in
        print("Received value: \(value) on thread \(Thread.current)")
}

//: [Next](@next)
