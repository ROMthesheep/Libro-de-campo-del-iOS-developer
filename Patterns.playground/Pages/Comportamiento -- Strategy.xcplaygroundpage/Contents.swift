//: [Previous](@previous)

/**
 El patron Startegy nos permite adaptar un proceso a la ejecucion, cambiando segun unas consiciones el flujo de informacion y sus procesos. Esto es tambien peligroso ya que crearemos un algoritmo que tiene independencia del flujo superior, operara de forma augonoma segun sus propias reglas.
 Este patron aunque pueda parecer simple puede llegar a complicarse una vez le empecemos a sumar capa sde abstraccion, tiene una escalabilidad muy buena pero compleja de seguir
 */

import Foundation

protocol SortingStratagy {
    func sort<T>(items: [T]) -> [T] where T: Comparable
}

struct FrontSortStratagy : SortingStratagy {
    func sort<T>(items: [T]) -> [T] where T: Comparable { items }
}

struct BackSortStratagy: SortingStratagy {
    func sort<T>(items: [T]) -> [T] where T: Comparable { items.reversed() }
}

struct Sorter {
    var strategy: SortingStratagy
    
    init(strategy: SortingStratagy) {
        self.strategy = strategy
    }
    
    func sort<T: Comparable>(items: [T]) -> [T] {
        strategy.sort(items: items)
    }
}

let items = [1,2,3,4,5,6,7,8,9,0]

var sorter = Sorter(strategy: FrontSortStratagy())
let quickedSortedItems = sorter.sort(items: items)
sorter.strategy = BackSortStratagy()
let mergedSortedItyems = sorter.sort(items: items)

//: [Next](@next)
