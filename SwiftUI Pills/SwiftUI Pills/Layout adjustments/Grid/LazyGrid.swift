//
//  LazyGrid.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 27/3/24.
//

import SwiftUI

struct LazyGrid: View {
    
    let animals = ["🐵","🐒","🦍","🦧","🐶","🐕","🦮","🐕‍🦺","🐩","🐺","🦊","🦝","🐱","🐈","🐈‍⬛","🦁","🐯","🐅","🐆","🐴","🫎","🫏","🐎","🦄","🦓","🦌","🦬","🐮","🐂","🐃","🐄","🐷","🐖","🐗","🐽","🐏","🐑","🐐","🐪","🐫","🦙","🦒","🐘","🦣","🦏","🦛","🐭"]
    @State private var sliderValue: CGFloat = 2
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: Int(sliderValue))
        return VStack {
            Slider(value: $sliderValue, in: 2...10, step: 1)
            Text(String(format: "%.0f", sliderValue))
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(animals, id: \.self) { animal in
                        Text(animal)
                            .font(.system(size: 50))
                    }
                })
            }
        }.padding()
    }
}

#Preview {
    LazyGrid()
}
