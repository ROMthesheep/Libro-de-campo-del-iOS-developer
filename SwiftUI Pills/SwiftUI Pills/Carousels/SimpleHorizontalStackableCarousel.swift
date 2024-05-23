//
//  SimpleStackableCarousel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/5/24.
//

import SwiftUI

struct SimpleHorizontalStackableCarousel: View {
    private let mainRoundedCornerValue: CGFloat = 25
    
    var body: some View {
        VStack {
            Spacer()
            Text("Scroll left")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    LazyHStack {
                        ForEach(0..<20) { index in
                            RoundedRectangle(cornerRadius: mainRoundedCornerValue)
                                .fill(Color.init(cgColor: CGColor(gray: 0.7, alpha: 0.7)))
                                .overlay {
                                    RoundedRectangle(cornerRadius: mainRoundedCornerValue)
                                        .stroke(.black, lineWidth: 2)
                                }
                                .overlay(content: {
                                    Text(["🏴‍☠️", "🌊", "🦜", "⚓️", "⚔️", "🪙", "🔱", "🍺"].randomElement()!)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 200))
                                })
                                .overlay(alignment: .topLeading, content: {
                                    Text(String(index))
                                        .font(.largeTitle)
                                        .padding()
                                })
                                .padding(20)
                                .containerRelativeFrame([.horizontal, .vertical])
                                .shadow(
                                    color: .primary.opacity(0.5),
                                    radius: 12
                                )
                                .scrollTargetLayout()
                                .modifier(StackEffect(index: index))
                        }
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
    
    struct StackEffect: ViewModifier {
        var index: Int
        func body(content: Content) -> some View {
            content.visualEffect { fx, geometry in
                fx
                    .blur(radius: progress(geometry) * 5 )
                    .scaleEffect(scale(geometry))
                    .offset(
                        x: minX(geometry) < 0 ? 0 : minX(geometry)
                    )
            }
        }
        
        private func scale(_ proxy: GeometryProxy) -> CGFloat {
            min(max(1 - progress(proxy) * 0.5, 0.8), 1)
        }
        
        private func progress(_ proxy: GeometryProxy) -> CGFloat {
            min(minX(proxy) / proxy.size.width, 1)
        }
        
        private func minX(_ proxy: GeometryProxy) -> CGFloat {
            proxy.bounds(of: .scrollView)?.minX ?? 0
        }
    }
}

#Preview {
        SimpleHorizontalStackableCarousel()
}
