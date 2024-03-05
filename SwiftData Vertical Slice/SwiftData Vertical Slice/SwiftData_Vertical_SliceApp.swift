//
//  SwiftData_Vertical_SliceApp.swift
//  SwiftData Vertical Slice
//
//  Created by RomTheSheep on 5/3/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_Vertical_SliceApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
