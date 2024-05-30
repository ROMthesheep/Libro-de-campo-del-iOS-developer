//
//  symbol animation.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 30/5/24.
//

import SwiftUI

struct symbolAnimation: View {
    
    @State private var animate = false
    @State private var replace = false
    @State private var pulse = false
    @State private var bounce = false
    
    var body: some View {
        VStack {
            Button(action: { animate.toggle() }) {
                Text("Start")
            }.padding([.bottom], 42)
            HStack {
                Image(systemName: "dot.radiowaves.left.and.right")
                    .symbolEffect(.variableColor.reversing.iterative, value: animate)
                Image(systemName: "dot.radiowaves.left.and.right")
                    .symbolEffect(.variableColor.reversing.cumulative, value: animate)
                Image(systemName: "dot.radiowaves.left.and.right")
                    .symbolEffect(.variableColor.iterative, value: animate)
                Image(systemName: "dot.radiowaves.left.and.right")
                    .symbolEffect(.variableColor.cumulative, value: animate)
            }
            .padding([.bottom], 21)
            HStack {
                Image(systemName: "dot.radiowaves.left.and.right")
                    .symbolEffect(.variableColor.reversing.iterative, options: .repeating, value: animate)
                Image(systemName: "dot.radiowaves.left.and.right")
                    .symbolEffect(.variableColor.reversing.cumulative, options: .repeat(5), value: animate)
                Image(systemName: "dot.radiowaves.left.and.right")
                    .symbolEffect(.variableColor.iterative, options: .speed(10.0).repeating, value: animate)
            }
            .padding([.bottom], 42)
            
            Button(action: { replace.toggle() }) {
                Label("Test replace", systemImage: replace ? "plus.circle" : "checkmark.circle")
                    .contentTransition(.symbolEffect(.replace))
            }.padding([.bottom], 42)
            
            Button(action: { pulse.toggle() }) {
                Label("Test Pulse", systemImage: "exclamationmark.triangle")
            }
            .symbolEffect(.pulse, options: .repeating.speed(10), value: pulse)
            .padding([.bottom], 42)
            
            Button(action: { bounce.toggle() }) {
                Label("Test Bounce", systemImage: "basketball")
            }
            .symbolEffect(.bounce, options: .repeating.speed(10), value: bounce)
            
        }
        .font(.largeTitle)
    }
}

#Preview {
    symbolAnimation()
}
