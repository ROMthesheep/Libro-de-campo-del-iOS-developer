//
//  Webservice.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 4/4/24.
//

import Foundation

enum AuthError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum LoginNetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

class LoginWebservice {
    
    func getAllAccounts(token: String, completion: @escaping (Result<[Account], LoginNetworkError>) -> Void) {
        guard let url = URL(string: "https://water-amenable-star.glitch.me/accounts") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var req = URLRequest(url: url)
        req.addValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            guard let data, error == nil else {
                completion(.failure(.noData))
                return
            }
            guard let accounts = try? JSONDecoder().decode([Account].self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            completion(.success(accounts))
        }.resume()
    }
    
    func login(body: LoginRequestBody, completion: @escaping (Result<String, AuthError>) -> Void) {
        guard let url = URL(string: "https://water-amenable-star.glitch.me/login") else {
            completion(.failure(.custom(errorMessage: "Error in URL formation")))
            return
        }
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: req) { data, response, error in
            
            guard let data, error == nil else {
                completion(.failure(.custom(errorMessage: "No response")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
        }.resume()
    }
}
