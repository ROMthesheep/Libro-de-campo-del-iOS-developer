//
//  MeshGradientWaveDragGesture.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 12/6/24.
//

import SwiftUI

struct cogratsView: View {
    var body: some View {
        Text("You did something!")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .offset(y: 300)
    }
}

@available(iOS 18.0, *)
struct MeshGradientWaveDragGesture: View {
    @State var increment = CGSize.zero
    @State var updatedView: Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            Text(increment.height <= 300 ? "keep dragging" : "let go")
                .font(.largeTitle)
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    .init(0, 0), .init(0.5 + 0.0005 * Float(increment.width) , 0 + 0.001 * Float(increment.height)), .init(1, 0),
                    .init(0, 0.5), .init(0.3, 0.5 + 0.005 * Float(increment.height)), .init(1, 0.5),
                    .init(0, 1), .init(0.5, 1), .init(1, 1)
                ],
                colors: [
                    .red, .purple, .indigo,
                    .orange, .cyan, .blue,
                    .yellow, .green, .mint
                ])
            .gesture(DragGesture()
                .onChanged({ dragValue in
                    increment = dragValue.translation
                })
                    .onEnded({ _ in
                        updatedView = increment.height >= 250
                        increment = .zero
                    }))
            .animation(.spring, value: increment)
            .ignoresSafeArea()
            if updatedView {
                cogratsView()
            }
        }
    }
}

#Preview {
    if #available(iOS 18.0, *) {
        MeshGradientWaveDragGesture()
    } else {
        // Fallback on earlier versions
    }
}
