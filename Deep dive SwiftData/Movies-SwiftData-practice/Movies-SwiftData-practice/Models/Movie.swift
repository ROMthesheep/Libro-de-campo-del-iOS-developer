//
//  Movie.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 8/4/24.
//

import Foundation
import SwiftData

//typealias Movie = MovieSchemaV3.Movie

@Model
final class Movie {
    var title: String
    var year: Int
    var genreId: Int
    
    var genre: Genre {
        Genre(rawValue: genreId)!
    }
    
    var reviewCount: Int {
        reviews.count
    }
    
    var actorsCount: Int {
        actors.count
    }
    
    @Relationship(deleteRule: .cascade, inverse: \Review.movie) var reviews = [Review]()
    @Relationship(deleteRule: .nullify, inverse: \Actor.movies) var actors = [Actor]()
    
    init(title: String, year: Int, genre: Genre) {
        self.title = title
        self.year = year
        self.genreId = genre.id
    }
}
