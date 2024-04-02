//
//  NotificationAnimation.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        Text("ey! I have somthing to say")
            .foregroundStyle(.white)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .background(.blue)
            .cornerRadius(20)
    }
}

struct NotificationAnimation: View {
    
    @State var showNotification: Bool = false
    
    var body: some View {
        VStack {
            NotificationView()
                .offset(y: showNotification ? -UIScreen.main.bounds.height/3 : -UIScreen.main.bounds.height )
                .animation(.interpolatingSpring(
                    mass: 1.0,
                    stiffness: 100.0,
                    damping: 8,
                    initialVelocity: 0
                ), value: showNotification)
            Button("Press me!") {
                showNotification.toggle()
            }
        }
    }
}

#Preview {
    NotificationAnimation()
}
