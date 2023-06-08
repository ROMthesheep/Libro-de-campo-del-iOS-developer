//: [Previous](@previous)

import Foundation
import Combine


// Just
struct User {
    let email: String
    let name: String
}

let user = User(email: "email@emailBueno.com", name: "Ruperto")

let justPublisher = Just(user)

justPublisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("Done \(completion)")
    case .failure(let error):
        print("oh no! \(error)")
    }
}, receiveValue: { user in
    print("user: \(user)")
})

// Fail

enum RegisterFormError: String, Error {
    case userExist = "The user already exists"
    case wrongEmail = "Incorect Email"
    case wrongPassword = "Incorect Password"
    case unknown = "unknown error"
}

let failPublisher = Fail<Any, RegisterFormError>(error: RegisterFormError.unknown)
    

failPublisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("Done \(completion)")
    case .failure(let error):
        print("oh no! \(error)")
    }
}, receiveValue: { user in
    print("user: \(user)")
})

// ejemplo funcion

func register(user: User) -> AnyPublisher<User, RegisterFormError> {
    return user.email == "email@emailBueno.com" ?
    Just(user).setFailureType(to: RegisterFormError.self).eraseToAnyPublisher() :
    Fail(error: RegisterFormError.wrongEmail).eraseToAnyPublisher()
}

register(user: user).sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("Done \(completion)")
    case .failure(let error):
        print("oh no! \(error)")
    }
}, receiveValue: { user in
    print("user: \(user)")
})

register(user: .init(email: "email@emailMalo.com", name: "Juancho")).sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("Done \(completion)")
    case .failure(let error):
        print("oh no! \(error)")
    }
}, receiveValue: { user in
    print("user: \(user)")
})



//: [Next](@next)
