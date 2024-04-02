//
//  Magnify.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

struct ColorViewWithImage: View {
    @State private var scale: CGFloat = 1
    var body: some View {
        VStack {
            Text("Im a simple view")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Image("sheep")
                .resizable()
                .scaleEffect(scale)
                .frame(width: 300,height: 300)
                .gesture(MagnifyGesture()
                    .onChanged{ value in
                        scale = value.magnification
                    }
                    .onEnded({ value in
                        scale = 1
                    }))
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.pink)
    }
}

fileprivate struct MagnifyView: View {
    @State private var dragState = CGSize.zero
    var body: some View {
        ColorViewWithImage()
    }
}

#Preview {
    MagnifyView()
}
