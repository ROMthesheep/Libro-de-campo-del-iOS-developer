//
//  AppStoreWrapper.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 1/4/24.
//

import SwiftUI

enum Gender: String, Codable {
    case male = "male"
    case female = "female"
    case nb = "non binary"
}

struct ScreenSettings: Codable {
    let age: Int
    let name: String
    let gender: Gender
}

struct AppStoreWrapper: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        VStack {
            Text(isDarkMode ? "dark mode" : "light mode")
            Toggle(isOn: $isDarkMode) {
                Text("Select Mode")
            }.fixedSize()
            
            Text("the value in userdefaults is: \(UserDefaults.standard.bool(forKey: "isDarkMode"))")
        }
    }
}

struct AppStoreWrapperFromCustomObject: View {
    @AppStorage("SettingsObject")
    private var settingsData: Data = Data()
    @State private var output: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(output).font(.headline).padding()
            Text( "this is what we have in UserDefaults:\n\(UserDefaults.standard.object(forKey: "SettingsObject") ?? "nothing")").padding().multilineTextAlignment(.center)
            Button("First step: Save in App Storage") {
                let settings = ScreenSettings(age: 17, name: "Amparo", gender: .female)
                guard let settingsData = try? JSONEncoder().encode(settings) else { return }
                output = ""
                self.settingsData = settingsData
                            }
            Button("Second step: Load from App Storage") {
                guard let settings = try? JSONDecoder().decode(ScreenSettings.self, from: settingsData) else {
                    output = ""
                    return
                }
                output = "This is \(settings.name)\nA \(settings.age) years old \(settings.gender.rawValue)"
            }
            
            Button("Third step: Erase data in App Storage") {
                UserDefaults.standard.removeObject(forKey: "SettingsObject")
                output = ""
            }
            Text("Fourth step: experiment with the buttons and code! Try changing parameters and looking at the length of the memory slot").padding().multilineTextAlignment(.center)
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        Text("Using local variable").font(.title).padding().background(.teal).cornerRadius(20)
        AppStoreWrapper()
        Text("Using custom Object").font(.title).padding().background(.teal).cornerRadius(20)
        AppStoreWrapperFromCustomObject()
    }
}
