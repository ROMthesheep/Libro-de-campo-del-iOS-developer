//
//  SimpleCarousel.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 22/5/24.
//

import SwiftUI

struct SimpleCarousel: View {
    private let mainRoundedCornerValue: CGFloat = 25
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(0..<20) { index in
                    Rectangle()
                        .fill(Color(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: mainRoundedCornerValue)
                                .stroke(.primary, lineWidth: 4)
                                .blur(radius: 4)
                        })
                        .overlay(content: {
                            ZStack {
                                Rectangle()
                                    .fill(.pink)
                                    .cornerRadius(mainRoundedCornerValue)
                                    .scaleEffect(0.8)
                                Text(["🏴‍☠️", "🌊", "🦜", "⚓️", "⚔️", "🪙", "🔱", "🍺"].randomElement()!)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 200))
                            }
                        })
                        .cornerRadius(mainRoundedCornerValue)
                        .padding(10)
                        .containerRelativeFrame( .vertical, count: 4, span: 2, spacing: 0 )
                        .containerRelativeFrame( .horizontal, count: 10, span: 10, spacing: 0)
                        .shadow(
                            color: .primary.opacity(0.5),
                            radius: 12
                        )
                        .scrollTargetLayout()
                }
            }
        }
        .padding()
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        .scrollBounceBehavior(.always)
        .scrollTargetBehavior(.paging)
        .scrollClipDisabled()
    }
}

#Preview {
    SimpleCarousel()
}
