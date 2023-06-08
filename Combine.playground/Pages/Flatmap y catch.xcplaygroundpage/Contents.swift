//: [Previous](@previous)

import Foundation
import Combine

// Flatmap
struct User {
    let email: String
    let name: String
}

enum RegisterFormError: String, Error {
    case userExist = "The user already exists"
    case wrongEmail = "Incorect Email"
    case wrongPassword = "Incorect Password"
    case wrongName = "Incorect name"
    case unknown = "unknown error"
}

let user = User(email: "email@emailBueno.com", name: "Ruperto")

func register(user: User) -> AnyPublisher<User, RegisterFormError> {
    return user.email == "email@emailBueno.com" ?
    Just(user).setFailureType(to: RegisterFormError.self).eraseToAnyPublisher() :
    Fail<User, RegisterFormError>(error: RegisterFormError.wrongEmail).eraseToAnyPublisher()
}

func save(user: User) -> AnyPublisher<Bool, RegisterFormError> {
    return user.name == "Ruperto" ?
    Just(true).setFailureType(to: RegisterFormError.self).eraseToAnyPublisher() :
    Fail(error: RegisterFormError.wrongName).eraseToAnyPublisher()
}
func saveThatFails(user: User) -> AnyPublisher<Bool, RegisterFormError> {
    return user.name == "Julian" ?
    Just(true).setFailureType(to: RegisterFormError.self).eraseToAnyPublisher() :
    Fail(error: RegisterFormError.wrongName).eraseToAnyPublisher()
}

register(user: user)
    .flatMap { user in
        save(user: user)
    }.sink { result in
        switch result {
        case .finished:
            print("Done \(result)")
        case .failure(let error):
            print("oh no! \(error)")
        }
    } receiveValue: { value in
        print("Done! registered -> \(value)")
    }

register(user: user)
    .flatMap { user in
        saveThatFails(user: user)
    }.sink { result in
        switch result {
        case .finished:
            print("Done \(result)")
        case .failure(let error):
            print("oh no! \(error)")
        }
    } receiveValue: { value in
        print("Done! registered -> \(value)")
    }

register(user: user)
    .flatMap { user in
        saveThatFails(user: user)
    }
    .catch({ _ in
        Just(false)
    })
    .sink { result in
        switch result {
        case .finished:
            print("Done \(result)")
        case .failure(let error):
            print("oh no! \(error)")
        }
    } receiveValue: { value in
        print("Done! registered -> \(value)")
    }


//: [Next](@next)
