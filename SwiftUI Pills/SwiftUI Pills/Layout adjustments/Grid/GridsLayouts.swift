//
//  GridsLayouts.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 27/3/24.
//

import SwiftUI

struct GridsLayouts: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Fixed").font(.largeTitle)
                Text("Fixed Characteristics\nfixed size never adapts.\nIf there’s not enough space, fixed size can go out of screen.")
                LazyVGrid(columns: [
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100))]) {
                        ForEach(1...20, id: \.self) { index in
                            Text("Item \(index)")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                    }
                Rectangle().frame(maxHeight: 2).padding([.top,.bottom])
                LazyVGrid(columns: [
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),]) {
                        ForEach(1...20, id: \.self) { index in
                            Text("Item \(index)")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                    }
                Rectangle().frame(maxHeight: 2).padding([.top,.bottom])
                Text("Flexible").font(.largeTitle)
                Text("flexible Characteristics\n flexible columns try its best to remain with the columns you defined.\nBut if there’s not enough space, flexible creates a new row.")
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 50)),
                    GridItem(.flexible(minimum: 50)),
                    GridItem(.flexible(minimum: 50)),
                    GridItem(.flexible(minimum: 50))]) {
                        ForEach(1...21, id: \.self) { index in
                            Text("Item \(index)")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                    }
                Rectangle().frame(maxHeight: 2).padding([.top,.bottom])
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100)),
                    GridItem(.flexible(minimum: 100)),
                    GridItem(.flexible(minimum: 100)),
                    GridItem(.flexible(minimum: 100)),
                    GridItem(.flexible(minimum: 100)),
                    GridItem(.flexible(minimum: 100))]) {
                        ForEach(1...31, id: \.self) { index in
                            Text("Item \(index)")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                    }
                Text("Adaptative").font(.largeTitle)
                Text("adaptive Characteristics/nadaptive won’t follow the column numbers you defined./nadaptive columns always try to fill the remaining space.")
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 100)),
                    GridItem(.adaptive(minimum: 100))]) {
                        ForEach(1...21, id: \.self) { index in
                            Text("Item \(index)")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                    }
            }.frame(maxWidth: UIScreen.main.bounds.width)
        }.frame(maxWidth: UIScreen.main.bounds.width)
        
    }
}

#Preview {
    GridsLayouts()
}
