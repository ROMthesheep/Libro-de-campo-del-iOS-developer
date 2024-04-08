//
//  FilmWebService.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import Foundation

enum FilmNetworkError: Error {
    case badURL
    case badID
}

class FilmWebService {
    func getFilms(for query: String) async throws -> [Film] {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "http"
        urlBuilder.host = "omdbapi.com"
        urlBuilder.queryItems = [
            URLQueryItem(name: "s", value: query),
            URLQueryItem(name: "apikey", value: "69f93d7")
        ]
        guard let url = urlBuilder.url else { throw FilmNetworkError.badURL }
        
        let (data, res) = try await URLSession.shared.data(from: url)
        guard (res as? HTTPURLResponse)?.statusCode == 200 else { throw FilmNetworkError.badID }
        
        let movieResponse = try? JSONDecoder().decode(FilmResponse.self, from: data)
        return movieResponse?.films ?? []
    }
}
