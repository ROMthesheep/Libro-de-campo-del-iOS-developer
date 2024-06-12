//
//  MeshGradientWaveAnimation.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 11/6/24.
//

import SwiftUI

@available(iOS 18.0, *)
struct MeshGradientWaveAnimation: View {
    @State var increment: Float = 0.0
    @State var timer: Timer?
    
    var body: some View {
        ZStack {
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    // clamp head
                    [0, 0],
                    [0.5, 0],
                    [1, 0],
                    // create wave on center
                    [ // 0,1
                        rangedWave(-1...(-0.5), 0.125, increment),
                        rangedWave (0.3...0.6, 0.9, increment)
                    ],
                    [ // 1,1
                        rangedWave(0.2...0.7, 0.1, increment),
                        rangedWave (0.2...0.8, 0.3, increment)
                    ],
                    [ // 2,1
                        rangedWave(1.0...1.5, 0.01, increment),
                        rangedWave (0.4...0.8, 0.6, increment)
                    ],
                    // clamp foot
                    [0, 1],
                    [0.5, 1],
                    [1, 1],
                ],
                colors: [
                    .mint, .mint, .white,
                    .blue, .cyan, .indigo,
                    .white, .mint, .mint
                ]
            ).ignoresSafeArea()
            VStack {
                Text("raw value: \(String(format: "%.3f", increment))")
                    .font(.headline)
                Text("oscilating value: \(String(format: "%.3f", rangedWave (-1...1, 1, increment)))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }.foregroundColor(.white)
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
                increment += 0.01
            })
        }
    }
    
    func rangedWave(_ range: ClosedRange<Float>, _ timeMultiplier: Float, _ t: Float) -> Float {
        let amplitude = (range.upperBound - range.lowerBound) / 2
        let mid = (range.upperBound + range.lowerBound) / 2
        let wave = cos(t + t * timeMultiplier)
        return mid + amplitude * wave
    }
}

#Preview {
    if #available(iOS 18.0, *) {
        MeshGradientWaveAnimation()
    } else {
        // Fallback on earlier versions
    }
}
