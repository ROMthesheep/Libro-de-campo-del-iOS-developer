//
//  Movies_SwiftData_practiceApp.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI
import SwiftData

@main
struct Movies_SwiftData_practiceApp: App {
    
//    let container: ModelContainer
//    
//    init() {
//        do {
//            container = try ModelContainer(for: Movie.self, migrationPlan: MovieMigrationPlan.self, configurations: ModelConfiguration(for: Movie.self))
//        } catch {
//            fatalError(error.localizedDescription.description)
//        }
//    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MovieDashboardView()
            }
        }
        .modelContainer(for: Movie.self)
    }
}
