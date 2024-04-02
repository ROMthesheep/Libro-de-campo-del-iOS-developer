//
//  Tap.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

fileprivate struct TapView: View {
    @State private var tapped: Bool = false
    var body: some View {
        ColorView(gestureRecived: tapped)
            .gesture(TapGesture(count: 3)
            .onEnded { value in
                tapped.toggle()
            })
    }
}

#Preview {
    TapView()
}
