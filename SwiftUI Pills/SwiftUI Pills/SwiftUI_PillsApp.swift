//
//  SwiftUI_PillsApp.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 18/3/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_PillsApp: App {
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
            GroupingViews()
        }
        .modelContainer(sharedModelContainer)
    }
}
