//
//  Film.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import Foundation

struct FilmResponse: Decodable {
    let films: [Film]
    private enum CodingKeys: String, CodingKey {
        case films = "Search"
    }
}

struct Film: Decodable {
    let id: String
    let title: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case poster = "Poster"
    }
}
