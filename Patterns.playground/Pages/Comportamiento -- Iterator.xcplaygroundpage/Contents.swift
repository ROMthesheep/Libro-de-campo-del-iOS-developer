//: [Previous](@previous)

import Foundation

/**
 El patron Iterator es un patrón de diseño conductual que proporciona una interfaz estandarizada para recorrer una colección de elementos.
 La colección de elementos se representa como un objeto aggregate. El patrón descompone la lógica de iteración en un objeto iterator separado.
 
 Podemos implementar este patrón de un par de maneras diferentes: creando los protocolos iterator e iterable desde cero o podemos usar protocolos similares que ya son ofrecidos por la biblioteca estándar de Swift. Las diferencias entre los enfoques serán mínimas, excepto que necesites algunas características muy sofisticadas.
 
 Swift ya tiene un protocolo llamado IteratorProtocol que es responsable de suministrar los valores de una secuencia uno por uno. Para crear un iterador personalizado que se ajuste a nuestras necesidades, necesitamos crear un tipo que se ajuste al IteratorProtocol.
 
 Cuando tienes un tipo que necesita ser accedido y procesado en un bucle, utiliza el patrón Iterator. Este oculta la representación subyacente del tipo y crea lógica para acceder y recorrer elementos. La implementación en Swift es bastante sencilla, todo lo que necesitas entender es cómo usar un par de bloques de construcción como los protocolos IteratorProtocol y Sequence.
 Para usos más avanzados, echa un vistazo al protocolo Collection, que agrega la capacidad de subscripting por índice y extiende aún más las capacidades de iteración.
 */

enum ItemType {
    case typeA, typeB, typeC
}

struct Item {
    var id: Int
    var desc: String
}

struct Items {
    var type: ItemType
    var items: [Item]
}

struct ItemIterator: IteratorProtocol {
    private var current = 0
    private var items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }
    
    /// <#Description#>
    /// - Returns: <#description#>
    mutating func next() -> Item? {
        defer { current += 1 }
        return items.count > current ? items[current] : nil
    }
}

extension Items: Sequence {
    
    /// <#Description#>
    /// - Returns: <#description#>
    func makeIterator() -> AnyIterator<Item> {
        var iterator = items.makeIterator()
        
        return AnyIterator {
            while let next = iterator.next() {
                return next
            }
            return nil
        }
    }
}

let item1 = Item(id: 1, desc: "este es el primer item")
let item2 = Item(id: 2, desc: "este es el segundo item")
let item3 = Item(id: 3, desc: "este es el tercer item")
let item4 = Item(id: 4, desc: "este es el cuarto item")

let items = Items(type: .typeA, items: [item1, item2, item3, item4])
items.forEach { item in
    print(item)
}

//: [Next](@next)
