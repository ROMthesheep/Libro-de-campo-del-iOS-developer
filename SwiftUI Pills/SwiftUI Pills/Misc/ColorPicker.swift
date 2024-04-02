//
//  ColorPicker.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 27/3/24.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State private var color: Color = .pink
    
    var body: some View {
        ColorPicker("Select a color", selection: $color)
            .padding()
    }
}

#Preview {
    ColorPickerView()
}
