//
//  StackableCarousel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/5/24.
//

import SwiftUI

struct FancyStackableCarousel: View {
    private let mainRoundedCornerValue: CGFloat = 25
    var body: some View {
        VStack {
            Spacer()
            Text("Scroll left")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
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
                    .rotationEffect(.degrees(progress(geometry) * (index % 2 == 0 ? -23 : 23)), anchor: .center)
                    .scaleEffect(scale(geometry))
                    .offset(
                        x: minX(geometry) < 0 ? -minX(geometry) * 1.5 : minX(geometry),
                        y: minX(geometry) < 0 ? 0 : minX(geometry) / 2.5)
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
    FancyStackableCarousel()
}
