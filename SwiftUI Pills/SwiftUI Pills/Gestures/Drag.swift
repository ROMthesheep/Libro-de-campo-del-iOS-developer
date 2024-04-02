//
//  Drag.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

fileprivate struct DragView: View {
    @State private var tapped: Bool = false
    @State private var dragState = CGSize.zero
    var body: some View {
        ColorView(gestureRecived: tapped)
            .animation(.spring, value: dragState)
            .offset(y:dragState.height)
            .gesture(DragGesture()
                .onChanged{ value in
                    dragState = value.translation
                }
                    .onEnded{ value in
                        dragState = CGSize.zero
                    }
            )
    }
}

#Preview {
    DragView()
}
