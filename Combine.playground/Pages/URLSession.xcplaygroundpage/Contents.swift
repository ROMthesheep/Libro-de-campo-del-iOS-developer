//: [Previous](@previous)

import Foundation
import Combine

struct JokeDataModel: Decodable {
    let setup: String
    let delivery: String
}

let url = URL(string: "https://v2.jokeapi.dev/joke/Programming?type=twopart")!
let cancellable = URLSession.shared.dataTaskPublisher(for: url)
    .tryMap{ (data, response) -> Data in
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return data
    }
    .decode(type: JokeDataModel.self, decoder: JSONDecoder())
    .sink { finished in
        switch finished {
        case .finished:
            print("Done \(finished)")
        case .failure(let error):
            print("oh no! \(error.localizedDescription)")
        }
    } receiveValue: { data in
        print("\(data.setup)...\(data.delivery)!")
    }


//: [Next](@next)
