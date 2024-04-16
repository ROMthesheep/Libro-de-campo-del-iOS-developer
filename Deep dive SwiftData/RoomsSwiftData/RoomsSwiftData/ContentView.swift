//
//  ContentView.swift
//  RoomsSwiftData
//
//  Created by RomTheSheep on 12/4/24.
//

import SwiftUI
import SwiftData

struct ColorSelectorView: View {
    @Binding var selection: Color
    let colors: [Color] = [.red,.green,.blue,.yellow,.purple,.indigo,.cyan]
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .fill(color)
                    .overlay {
                        selection == color ? Circle().stroke(Color.black, lineWidth: 2) : nil
                    }
                    .onTapGesture {
                        selection = color
                    }
            }
        }
    }
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var name: String = ""
    @State private var color: Color = .red
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            ColorSelectorView(selection: $color)
            Button {
                let room = Room(name: name, color: UIColor(color))
                context.insert(room)
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding([.top],20)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Room.self], inMemory: true)
}
