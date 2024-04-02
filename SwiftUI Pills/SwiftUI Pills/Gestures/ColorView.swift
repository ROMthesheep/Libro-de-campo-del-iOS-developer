//
//  ColorView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

struct ColorView: View {
    let gestureRecived: Bool
    var body: some View {
        VStack {
            Text("Im a simple view")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(gestureRecived ? .green: .pink)
    }
}
