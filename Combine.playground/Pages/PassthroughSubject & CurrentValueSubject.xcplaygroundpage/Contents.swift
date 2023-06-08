//: [Previous](@previous)

import Foundation
import Combine

/**
 Un PassthroughSubject es como un timbre
    Cuando alguien pulsa el timbre, solo te llega la informacion de que alguien ha
    pulsado el interruptior si ya estas ahi
 Un CurrentValueSubject es como un interruptor de una luz
    Si alquien enciende la luz cuando no estas en casa, cuando vulvas sabras que alguien pulso el interruptor.
 */

// PassthroughSubject
struct Weather {
    let weatherPublisher = PassthroughSubject<Int, Error>()
    func getWeatherInfo() {
        weatherPublisher.send(35)
        weatherPublisher.send(32)
        
        // Estas dos formas de finalizar dispararan el sink completion
        true ?
        weatherPublisher.send(completion: .finished) :
        weatherPublisher.send(completion: .failure(URLError(.badURL)))
        
        weatherPublisher.send(69)
    }
}

let weather = Weather()
weather.weatherPublisher.sink { completion in
    switch completion {
    case .finished:
        print("Finalizado con exito")
    case .failure(let err):
        print("oh no! \(err)")
    }
} receiveValue: { value in
    print("Values: \(value)")
}

weather.getWeatherInfo()

// CurrentValueSubject

struct BotApp {
    var onBoardingPublisher = CurrentValueSubject<String, Error>("Bienvenido!")
    
    func startOnboarding() {
        onBoardingPublisher.send("Paso 1")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            onBoardingPublisher.send("Paso 2")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            onBoardingPublisher.send("Paso 3")
        }
    }
}

let appBot = BotApp()

// se asigna a una variable para que siga escuchando y no se libere de memoria
let cancellable = appBot.onBoardingPublisher
//    .handleEvents(receiveSubscription: { item in
//        print("1. subscription recived \(item)")
//    }, receiveOutput: { item in
//        print("2. value recived \(item)")
//    }, receiveCompletion: { item in
//        print("3. completion recived \(item)")
//    }, receiveCancel: {
//        print("4. cancel recived")
//    }, receiveRequest: { item in
//        print("5. request recived \(item)")
//    })
    .sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("Esto es todo!")
    case .failure(let err):
        print("Algo ha ocurrido! \(err)")
    }
}, receiveValue: { value in
    print("Values: \(value)")
})

appBot.startOnboarding()


// Handle errors and retry

enum MyCustomError: Error {
    case customError
}

func mapStrinfToInt(value: String) throws -> Int {
    guard let result = Int(value) else {
        throw MyCustomError.customError
    }
    return result
}

let stringPublisher = PassthroughSubject<String, MyCustomError>()

stringPublisher
    .tryMap({ value in
        try mapStrinfToInt(value: value)
    })
    .retry(2) // numero de fallos maximos por stream
    .sink { finished in
    switch finished {
    case .finished:
        print("Done! \(finished)")
    case .failure(let error):
        print("oh no \(error)")
    }
} receiveValue: { value in
    print("Values: \(value)")
}

stringPublisher.send("35")
stringPublisher.send("croquetas")
stringPublisher.send("32")
stringPublisher.send("jamon")
stringPublisher.send("69")
stringPublisher.send("420")

//: [Next](@next)
