//
//  PinnedViewGrid.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 27/3/24.
//

import SwiftUI

struct PinnedViewGrid: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    private func getHeader(_ sectionIndex: Int) -> some View {
        Text("Section \(sectionIndex)")
            .padding()
            .foregroundStyle(.white)
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .background(.gray)
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders], content: {
                    
                    ForEach(1..<11) { index in
                        Section(header: getHeader(index)) {
                            ForEach(1..<19) {_ in
                                Rectangle()
                                    .fill(.red)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                })
            }.padding()
        }.navigationTitle("Pinned Views")
            
    }
}

#Preview {
    PinnedViewGrid()
}
