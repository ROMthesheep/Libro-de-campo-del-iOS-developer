//
//  NotificationSettings.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

struct NotificationSettings: View {
    @State private var showPreviews: Bool = false
    @State private var images = ["🎑","🌠","🌅","🌄","🏙️","🎇","🎑","🌠","🌅","🌄","🏙️","🎇","🎑","🌠","🌅","🌄","🏙️","🎇"]
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Notification previews will be shown whether the iphone is locked or unlocked")) {
                    HStack {
                        Text("Show Previews")
                        Spacer()
                        Toggle(isOn: $showPreviews, label: {})
                    }
                }
                
                Section(footer: Text("Choose while apps can suggest shortcuts on the lock screen")) {
                    HStack {
                        Text("Siri Suggestions")
                        Spacer()
                        NavigationLink(destination: Text("upssss"), label: {})
                    }
                }
                
                Section(header: Text("Notification style")) {
                    List {
                        ForEach(Array(zip(images.indices, images)), id: \.0) { index, img in
                            HStack {
                                Text(img).font(.largeTitle)
                                Text("Notification \(index)")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationSettings()
}
