//
//  SimpleVerticalStackableCarousel.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 22/5/24.
//

import SwiftUI

struct SimpleVerticalStackableCarousel: View {
    private let mainRoundedCornerValue: CGFloat = 25
    
    var body: some View {
        VStack {
            Spacer()
            Text("Scroll up")
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    LazyVStack {
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
                                .containerRelativeFrame( .vertical, count: 3, span: 2, spacing: 0 )
                                .containerRelativeFrame( .horizontal, count: 10, span: 10, spacing: 0)
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
                    .blur(radius: progress(geometry, index: index, a: true) * 5 )
                    .scaleEffect(scale(geometry))
                    .offset(
                        y: minY(geometry) < 0 ? 0 : minY(geometry)
                    )
            }
        }
        
        private func scale(_ proxy: GeometryProxy) -> CGFloat {
            min(max(1 - progress(proxy) * 0.5, 0.8), 1)
        }
        
        private func progress(_ proxy: GeometryProxy, index: Int = 0, a:Bool = false) -> CGFloat {
            if a {
                print("\(index): \(min(minY(proxy) / proxy.size.height, 1))")
            }
            
            return min(minY(proxy) / proxy.size.height, 1)
        }
        
        private func minY(_ proxy: GeometryProxy) -> CGFloat {
            proxy.bounds(of: .scrollView)?.minY ?? 0
        }
    }
}
#Preview {
    SimpleVerticalStackableCarousel()
}
