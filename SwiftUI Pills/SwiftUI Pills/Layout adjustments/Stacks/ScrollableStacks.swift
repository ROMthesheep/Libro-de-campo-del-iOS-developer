//
//  ScrollableStacks.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 23/5/24.
//

import SwiftUI

struct ScrollableStacks: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(1..<100) {_ in
                    ZstackBasics()
                }
            }
        }
    }
}

#Preview {
    ScrollableStacks()
}
