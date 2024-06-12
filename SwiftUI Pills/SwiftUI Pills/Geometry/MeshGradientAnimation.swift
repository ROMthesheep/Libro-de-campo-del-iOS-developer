//
//  MeshGradientAnimation.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 11/6/24.
//

import SwiftUI

struct MeshGradientAnimation: View {
    @State var increment: Float = 0.0
    @State var timer: Timer?
    @State var contracting: Bool = true
    
    var body: some View {
        ZStack {
            Text(String(increment))
            if #available(iOS 18.0, *) {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [
                        .init(0, 0), .init(0.5, increment), .init(1, 0),
                        .init(0, 0.5), .init(0.3, 0.5+increment), .init(1, 0.5),
                        .init(0, 1), .init(0.5, 1+increment), .init(1, 1)
                    ],
                    colors: [
                        .red, .purple, .indigo,
                        .orange, .cyan, .blue,
                        .yellow, .green, .mint
                    ])
            } else {
                // Fallback on earlier versions
            }
            Text(String(increment))
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                if contracting {
                    increment += 0.02
                    if increment >= 0.8 {
                        contracting = false
                    }
                } else {
                    increment -= 0.02
                    if increment <= 0 {
                        contracting = true
                    }
                }
            })
        }
    }
    
}

#Preview {
    MeshGradientAnimation()
}
