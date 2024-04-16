//
//  MovieSchema.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 10/4/24.
//

import Foundation
import SwiftData

enum MovieSchemaV1: VersionedSchema {
    static var versionIdentifier: Schema.Version = Schema.Version(1,0,0)
    static var models: [any PersistentModel.Type] {
        [Movie.self]
    }
    
    @Model
    final class Movie {
        var title: String
        var year: Int
        
        var reviewCount: Int {
            reviews.count
        }
        
        var actorsCount: Int {
            actors.count
        }
        
        @Relationship(deleteRule: .cascade, inverse: \Review.movie) var reviews = [Review]()
        @Relationship(deleteRule: .nullify, inverse: \Actor.movies) var actors = [Actor]()
        
        init(title: String, year: Int) {
            self.title = title
            self.year = year
        }
    }
}

enum MovieSchemaV2: VersionedSchema {
    static var versionIdentifier: Schema.Version = Schema.Version(2,0,0)
    static var models: [any PersistentModel.Type] {
        [Movie.self]
    }
    
    @Model
    final class Movie {
        @Attribute(.unique) var title: String
        var year: Int
        
        var reviewCount: Int {
            reviews.count
        }
        
        var actorsCount: Int {
            actors.count
        }
        
        @Relationship(deleteRule: .cascade, inverse: \Review.movie) var reviews = [Review]()
        @Relationship(deleteRule: .nullify, inverse: \Actor.movies) var actors = [Actor]()
        
        init(title: String, year: Int) {
            self.title = title
            self.year = year
        }
    }
}

enum MovieSchemaV3: VersionedSchema {
    static var versionIdentifier: Schema.Version = Schema.Version(2,0,0)
    static var models: [any PersistentModel.Type] {
        [Movie.self]
    }
    
    @Model
    final class Movie {
        @Attribute(.unique, originalName: "title") var movieTitle: String
        var year: Int
        
        var reviewCount: Int {
            reviews.count
        }
        
        var actorsCount: Int {
            actors.count
        }
        
        @Relationship(deleteRule: .cascade, inverse: \Review.movie) var reviews = [Review]()
        @Relationship(deleteRule: .nullify, inverse: \Actor.movies) var actors = [Actor]()
        
        init(movieTitle: String, year: Int) {
            self.movieTitle = movieTitle
            self.year = year
        }
    }
}

