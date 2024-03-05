//: [Previous](@previous)

/**
 Usaremos el patron TypeEnsure cuando necesitemos forzar un tipado en base a un protocolo (Protocol 'Foo' can only be used as a generic constraint because it has Self or associated type requirements), esto puede darse en situaciones complejas de ordencion de datos, a priori no existe problema, ya que siempre podemos hacer uso de un default type (Foo as? FooType) pero con el patron tendremos un acabado mas elegante y mas refinado de este problema.
 
 Aunque el patron es una herramienta poderosa, este defecto viene dado por la naturaleza misma de la POO y es imposible desacerse del todo de ello, es una forma util para garantizar que el dato que llega es lo que queremos que sea y que no tengamos que estar descartando opciones no validas.
 Su uso es para casos muy corner pero es una herramienta que merece la pena conocer para usarla en los pocos casos que si que es util
 */

protocol Storable { }

protocol ShelfProtocol: AnyObject {
    
    associatedtype Contents: Storable

    var contents: [Contents] { get set }
    
    func open()
    func close()
    func isEmpty() -> Bool
}

extension ShelfProtocol {
    func isEmpty() -> Bool {
        return contents.isEmpty
    }
}

struct Book: Storable {
    var name: String
    var author: String
}

struct CompactDisk: Storable {
    typealias Date = String
    
    var name: String
    var release: Date
}

class BookShelf: ShelfProtocol {
    typealias Contents = Book

    var contents: [Contents] = []
    
    func open() {
        print("Opened BookShelf")
    }
    
    func close() {
        print("Closed BookShelf")
    }
}

class CompactDiskShelf: ShelfProtocol {
    typealias Contents = CompactDisk
    
    var contents: [Contents] = []
    
    func open() {
        print("Opened CompactDiskShelf")
    }
    
    func close() {
        print("Closed CompactDiskShelf")
    }
}

// Harry Potter books
let brandonLibreria = BookShelf()
brandonLibreria.contents += [Book(name: "Elantris", author: "Mi padre"),
                     Book(name: "El imperio final", author: "Mi padre"),
                     Book(name: "El camino de los reyes", author: "Mi padre")]

// Lord of the Rings books
let tolkienLibreria = BookShelf()
tolkienLibreria.contents += [Book(name: "El hobbit", author: "Tolkien"),
Book(name: "El retorno del rey", author: "Tolkien")]

// Shelf with Rock and Jazz compact disks
let compactDiskShelf = CompactDiskShelf()
compactDiskShelf.contents += [CompactDisk(name: "Meteora", release: "Linkin Park"),
                              CompactDisk(name: "Bluryface", release: "twenty One Pilots")]

/**
 y si hacemos la linea 90 nos devuelve un
 Use of protocol 'ShelfProtocol' as a type must be written 'any ShelfProtocol' Replace 'ShelfProtocol' with 'any ShelfProtocol'
 Cosa que no quereos hacer
 */
//let bookShelves: [ShelfProtocol] = [brandonLibreria, tolkienLibreria, compactDiskShelf]

// Esta es la solucion pochita
let shelves = [brandonLibreria, tolkienLibreria, compactDiskShelf] as [AnyObject]

if let compactDiskShelf = shelves.first as? CompactDiskShelf {
    print("Tenemos musica en: ", compactDiskShelf)
}

// y ahora la solucion a este problema

final class AnyShelf<T>: ShelfProtocol where T: Storable { //forzamos un tipo generico obligatorio, asi el protocolo queda tipado desde su concepcion durtante toda la ejecucion
   
    // MARK: - Properties
    
    typealias Contents = T
    
    var contents: [T]
    
    // MARK: - Private properties
    
    private let _open: () -> ()
    private let _close: () -> ()
    private let _isEmpty: () -> Bool
    
    // MARK: - Initializers
    /**
     Aqui tenemos que forzar la vinculacion entre el protocolo de bajo nivel y la clase de alto nivel, crando un puente de compatibilidad que nos asegure lo que estamos haciendo
     */
    init<P: ShelfProtocol>(protocol: P) where P.Contents == T {
        contents = `protocol`.contents
        _open = `protocol`.open
        _close = `protocol`.close
        _isEmpty = `protocol`.isEmpty
    }
    
    // MARK: - Methods
    
    func open() {
        _open()
    }
    
    func close() {
        _close()
    }
    
    func isEmpty() -> Bool {
        return _isEmpty()
    }
}

let biblioteca: [AnyShelf<Book>] = [AnyShelf(protocol: brandonLibreria),
                                        AnyShelf(protocol: tolkienLibreria)]

for (index, shelf) in biblioteca.enumerated() {
    print("index: \(index), ", shelf.contents)
    print()
}

//: [Next](@next)
