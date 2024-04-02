//
//  State examples.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 18/3/24.
//

import SwiftUI

struct SimpleCounter: View {
    @State private var counter = Int()
    
    var body: some View {
        VStack {
            Text("\(counter)")
                .font(.largeTitle)
            Button("Increment") {
                counter += 1
            }
        }
    }
}

struct SimpleToggle: View {
    @State private var isOn = Bool()
    var body: some View {
        VStack {
            Toggle(isOn: $isOn, label: {
                Text(isOn ? "ON" : "OFF")
            }).fixedSize()
        }
    }
}

#Preview {
    VStack {
        SimpleCounter()
        SimpleToggle()
    }
}
