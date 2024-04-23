//
//  ArtworkDetailInteractor.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation

class ArtworkDetailInteractor {
    
    enum ClientError: Error {
        case badURL, badService, badParse
    }
    
    func getDetailMovie(withId id: Int) async throws -> ArtworkDetailResponse {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = "api.artic.edu"
        urlBuilder.path = "/api/v1/artworks/\(id)"
        
        guard let url = urlBuilder.url else { throw ClientError.badURL }
        
        let (data, res) = try await URLSession.shared.data(from: url)
        guard (res as? HTTPURLResponse)?.statusCode == 200 else { throw ClientError.badService }
        
        guard let output = try? JSONDecoder().decode(ArtworkDetailResponse.self, from: data) else { throw ClientError.badParse }
        return output
    }
}
