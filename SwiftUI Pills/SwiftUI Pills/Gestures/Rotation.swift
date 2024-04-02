//
//  Rotation.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

fileprivate struct RotationView: View {
    @State private var rotation: Angle = Angle(degrees: 0)
    var body: some View {
        ColorView(gestureRecived: false)
            .rotationEffect(rotation)
            .gesture(RotateGesture()
                .onChanged({ value in
                    rotation = value.rotation
                }))
    }
}

#Preview {
    RotationView()
}

