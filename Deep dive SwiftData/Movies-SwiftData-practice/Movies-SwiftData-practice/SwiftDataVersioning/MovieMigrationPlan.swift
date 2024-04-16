//
//  MovieMigrationPlan.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 10/4/24.
//

import Foundation
import SwiftData


enum MovieMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
//        [MovieSchemaV1.self, MovieSchemaV2.self, MovieSchemaV3.self]
        [MovieSchemaV2.self, MovieSchemaV3.self]
    }
    
    static var stages: [MigrationStage] {
//        [migrateV1ToV2, migrateV2ToV3]
        [migrateV2ToV3]
    }
    
    static let migrateV1ToV2 = MigrationStage.custom(fromVersion: MovieSchemaV1.self, toVersion: MovieSchemaV2.self, willMigrate: { context in
        
        guard let movies = try? context.fetch(FetchDescriptor<Movie>()) else { return }
        
        var uniques = Set<String>()
        var dupes = Set<Movie>()
        
        for movie in movies {
            if !uniques.insert(movie.title).inserted {
                dupes.insert(movie)
            }
        }
        for movie in dupes {
            guard let movieToBeUpgraded = movies.first(where: { $0.id == movie.id }) else { continue }
            movieToBeUpgraded.title = movieToBeUpgraded.title + " \(UUID().uuidString)"
        }
        try? context.save()
    }, didMigrate: nil)
    
    static let migrateV2ToV3 = MigrationStage.lightweight(fromVersion: MovieSchemaV2.self, toVersion: MovieSchemaV3.self)
}
