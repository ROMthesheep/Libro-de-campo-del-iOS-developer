//
//  Client.swift
//  MVC
//
//  Created by RomTheSheep on 16/4/24.
//

import Foundation

enum ClientError: Error {
    case badURL, badService, badParse
}


final class Client {
    func getArtworks(page: Int = 50) async throws -> ArtworkListingResponse {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = "api.artic.edu"
        urlBuilder.path = "/api/v1/artworks"
        urlBuilder.queryItems = [URLQueryItem(name: "page", value: String(page))]
        
        guard let url = urlBuilder.url else { throw ClientError.badURL }
        
        let (data, res) = try await URLSession.shared.data(from: url)
        guard (res as? HTTPURLResponse)?.statusCode == 200 else { throw ClientError.badService }
        
        guard let output = try? JSONDecoder().decode(ArtworkListingResponse.self, from: data) else { throw ClientError.badParse }
        return output
    }
}
