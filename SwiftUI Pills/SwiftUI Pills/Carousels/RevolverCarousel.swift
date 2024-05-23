//
//  RevolverCarousel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 22/5/24.
//

import SwiftUI

struct RevolverCarousel: View {
    private let mainRoundedCornerValue: CGFloat = 25
    @State var xOffsetConstant: CGFloat = 0.3
    @State var yOffsetConstant: CGFloat = 0.8
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .center) {
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
                            .modifier(StackEffect(index: index, yConstant: yOffsetConstant, xConstant: xOffsetConstant))
                    }
                }
            }
            .padding()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .scrollBounceBehavior(.always)
            .scrollTargetBehavior(.paging)
        .scrollClipDisabled()
            HStack {
                Text("X offset variation \(String(format: "%.\(2)f", xOffsetConstant))")
                Slider(value: $xOffsetConstant, in: 0...1)
            }
            .padding()
            HStack {
                Text("Y offset variation \(String(format: "%.\(2)f", yOffsetConstant))")
                Slider(value: $yOffsetConstant, in: 0...1)
            }
            .padding()
        }
    }
    
    struct StackEffect: ViewModifier {
        var index: Int
        var yConstant: CGFloat
        var xConstant: CGFloat
        func body(content: Content) -> some View {
            content.visualEffect { view, geo in
                let xOffset = -minX(geo) * xConstant
                let yOffset = progress(geo) < 0 ? minX(geo) * yConstant : -minX(geo) * yConstant
                return view
                    .blur(radius: progress(geo) * 10)
                    .scaleEffect(scale(geo))
                    .rotationEffect(.degrees(progress(geo) * (index % 2 == 0 ? 45 : 45)), anchor: .center)
                    .offset(CGSize(width: xOffset, height: yOffset))
            }
        }
        
        private func progress(_ geo: GeometryProxy) -> CGFloat {
            min(minX(geo)/geo.size.height,1)
        }
        
        private func scale(_ geo: GeometryProxy) -> CGFloat {
            let minScale = max(0.8, 1 - progress(geo))
            return min(1, minScale)
        }
        
        private func minX(_ geo: GeometryProxy, i: Int? = nil) -> CGFloat {
            geo.bounds(of: .scrollView)?.minX ?? 0
        }
        
    }
}

#Preview {
    RevolverCarousel()
}
