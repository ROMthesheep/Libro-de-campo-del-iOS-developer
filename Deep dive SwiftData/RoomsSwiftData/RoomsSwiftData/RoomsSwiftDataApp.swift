//
//  RoomsSwiftDataApp.swift
//  RoomsSwiftData
//
//  Created by RomTheSheep on 12/4/24.
//

import SwiftUI

@main
struct RoomsSwiftDataApp: App {
    init() {
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
