//
//  APIClient.swift
//  MVVM & combine practice
//
//  Created by Luca Lago on 5/6/23.
//

import Foundation
enum NetworkError: String, Error {
    case invalidPass = "Comprueba tu contraseña"
    case invalidUser = "Comprueba tu usuario"
}

final class APIClient {
    func login(withEmail email: String, password: String) async throws -> User {
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return try simulateBackendLogin(email: email, password: password)
    }
}

func simulateBackendLogin(email: String, password: String) throws -> User{
    guard email == "miemail" else {
        print("El user no es correcto")
        throw NetworkError.invalidUser
    }
    guard password == "croqueta" else {
        print("La contraseña no es correcta")
        throw NetworkError.invalidPass
    }
    
    print("Success")
    return .init(name: "Luca", token: "tokentokentokentoken", sessionStart: .now)
}
