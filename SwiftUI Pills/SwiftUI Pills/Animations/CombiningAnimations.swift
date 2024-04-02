//
//  CombiningAnimations.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import SwiftUI

struct CombiningAnimations: View {
    
    @State private var isAnimation: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("🐔")
                .font(.custom("", size: 120))
                .scaleEffect(isAnimation ? 2 : 1)
                .rotationEffect(.degrees(isAnimation ? 360 : 0))
                .animation(.interpolatingSpring(
                mass: 1,
                stiffness: 100,
                damping: 5
                ), value: isAnimation)
            Spacer()
            Button("Press me!") {
                isAnimation.toggle()
            }
            .padding()
        }
    }
}

#Preview {
    CombiningAnimations()
}
