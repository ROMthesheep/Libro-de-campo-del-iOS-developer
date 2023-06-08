//: [Previous](@previous)

import Foundation
import Combine

func createUser() -> Future<String, Never> {
    return Future { promise in
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 5) {
            promise(.success("Vengo del futuro!"))
        }
    }
}

createUser().sink { value in
    print(value)
}

// Ejemplo practico

struct JokeDataModel: Decodable {
    let setup: String
    let delivery: String
}


// version tradicional del problema
func getResources(completion: @escaping (JokeDataModel) -> Void) {
    let url = URL(string: "https://v2.jokeapi.dev/joke/Programming?type=twopart")!
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data else { return }
        let dataModel = try! JSONDecoder().decode(JokeDataModel.self, from: data)
        completion(dataModel)
    }.resume()
}

getResources { data in
    print("\(data.setup)...\(data.delivery)!")
}

// Version con Combine
func getResourcePromise() -> Future<JokeDataModel, Never> {
    return Future { promise in
        let url = URL(string: "https://v2.jokeapi.dev/joke/Programming?type=twopart")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            let dataModel = try! JSONDecoder().decode(JokeDataModel.self, from: data)
            promise(.success(dataModel))
        }.resume()
    }
}

let cancellable = getResourcePromise().sink { data in
    print("\(data.setup)...\(data.delivery)!")
}

var cancellabes = Set<AnyCancellable>()
getResourcePromise().sink { data in
    print("\(data.setup)...\(data.delivery)!")
}.store(in: &cancellabes)

//: [Next](@next)
