//
//  OverlayBasics.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 23/5/24.
//

import SwiftUI

struct OverlayBasics: View {
    @State var oscilate = false
    var body: some View {
        Rectangle()
            .fill(Color.blue.opacity(0.10))
            .overlay{
                HStack {
                    Image(systemName: "")
                    Text("Animated Overlay")
                        .multilineTextAlignment(.center)
                }
                .position(x: oscilate ? 100 : 300, y: 550)
            }
            .overlay{
                HStack {
                    Image(systemName: "")
                    Text("Custom\noverlay\nwith position")
                        .multilineTextAlignment(.center)
                }
                .position(x: 100, y: 200)
            }
        .overlay{
                HStack {
                    Image(systemName: "")
                    Text("Custom\noverlay\nwith offset")
                        .multilineTextAlignment(.center)
                }
                .offset(x: 100, y: -177)
            }
        
            .overlay { // .overlay(alignment: .center) also gets the same result
                HStack {
                    Image(systemName: "")
                    Text("Center\noverlay")
                        .multilineTextAlignment(.center)
                }
            }
            .overlay(alignment: .bottom) {
                VStack {
                    Text("True\nBottom")
                        .multilineTextAlignment(.center)
                    HStack {
                        Image(systemName: "arrow.down")
                        Image(systemName: "arrow.down")
                        Image(systemName: "arrow.down")
                    }
                }
            }
            .overlay(alignment: .bottomLeading) {
                VStack {
                    Text("Bottom\nLeading")
                        .multilineTextAlignment(.center)
                    HStack {
                        Image(systemName: "arrow.down.left")
                        Image(systemName: "arrow.down.left")
                        Image(systemName: "arrow.down.left")
                    }
                }
            }
            .overlay(alignment: .bottomTrailing) {
                VStack {
                    Text("Bottom\nTrailing")
                        .multilineTextAlignment(.center)
                    HStack {
                        Image(systemName: "arrow.down.right")
                        Image(systemName: "arrow.down.right")
                        Image(systemName: "arrow.down.right")
                    }
                }
            }
            .overlay(alignment: .topTrailing) {
                VStack {
                    HStack {
                        Image(systemName: "arrow.up.right")
                        Image(systemName: "arrow.up.right")
                        Image(systemName: "arrow.up.right")
                    }
                    Text("Top\nTrailing")
                        .multilineTextAlignment(.center)
                }
            }
            .overlay(alignment: .topLeading) {
                VStack {
                    HStack {
                        Image(systemName: "arrow.up.left")
                        Image(systemName: "arrow.up.left")
                        Image(systemName: "arrow.up.left")
                    }
                    Text("Top\nTrailing")
                        .multilineTextAlignment(.center)
                }
            }
            .overlay(alignment: .top) {
                VStack {
                    HStack {
                        Image(systemName: "arrow.up")
                        Image(systemName: "arrow.up")
                        Image(systemName: "arrow.up")
                    }
                    Text("True\nTop")
                        .multilineTextAlignment(.center)
                }
            }
            .overlay(alignment: .leading) {
                HStack {
                    VStack(spacing: 20) {
                        Image(systemName: "arrow.left")
                        Image(systemName: "arrow.left")
                        Image(systemName: "arrow.left")
                    }
                    Text("True\nLeading")
                        .multilineTextAlignment(.leading)
                }
            }
            .overlay(alignment: .trailing) {
                HStack {
                    Text("True\nTrailing")
                        .multilineTextAlignment(.trailing)
                    VStack(spacing: 20) {
                        Image(systemName: "arrow.right")
                        Image(systemName: "arrow.right")
                        Image(systemName: "arrow.right")
                    }
                }
            }
            .onAppear {
                withAnimation(Animation.default.repeatForever(), { oscilate.toggle() })
            }
    }
}

#Preview {
    OverlayBasics()
}
