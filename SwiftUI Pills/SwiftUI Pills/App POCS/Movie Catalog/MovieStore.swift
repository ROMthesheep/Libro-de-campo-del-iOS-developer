//
//  MovieStore.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 1/4/24.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let imdbID: String
    let title: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case poster = "Poster"
    }
}

class MovieStore: ObservableObject {
    @Published var movies: [Movie]? = [Movie]()
    
    func fetchMovies(searchTerm: String = "avatar") {
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(searchTerm.lowercased())&apikey=69f93d7") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            
            if let movieResponse = movieResponse {
                DispatchQueue.main.async {
                    self.movies = movieResponse.movies
                }
            }
        }.resume()
    }
}
