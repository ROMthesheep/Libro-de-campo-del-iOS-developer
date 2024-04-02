//
//  SpringAnimation.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import SwiftUI

struct SpringAnimation: View {
    @State var fly: Bool = false
    var body: some View {
        VStack {
            Button(action: {fly.toggle()}, label: {
                Text("Press me")
            })
            HStack {
                Text("🛬")
                    .font(.custom("", size: 100))
                    .offset(x: fly ? 300 : 0)
//                    .animation(.spring, value: fly)
                    .animation(.interpolatingSpring(mass: 5.0, stiffness: 100, damping: 10, initialVelocity: 0), value: fly)
                Spacer()
            }
        }
    }
}

#Preview {
    SpringAnimation()
}
