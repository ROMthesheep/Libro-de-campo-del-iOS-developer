//
//  CustomModifiers.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 27/3/24.
//

import SwiftUI


/// Rating view description thingy
struct RatingView: View {
    @Binding var score: Int?
    private func starType(for index: Int) -> String {
        index <= score ?? 0 ? "star.fill" : "star"
    }
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starType(for: index))
                    .foregroundStyle(.yellow)
                    .onTapGesture {
                        self.score = index
                    }
            }
        }
    }
}

extension Image {
    /// Resizes the image to the desired frame with the .fill contentMode
    /// - Parameters:
    ///   - width: desired frame width
    ///   - height: desired frame height
    /// - Returns: An Image that constrains this view’s dimensions height and width to the values indicated.
    func reszedToFill(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
}

struct PhotoViewModifier: View {
    var body: some View {
        HStack {
            Image("sheep")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
            
            Image("sheep")
                .reszedToFill(width: 100, height: 100)
        }
    }
}

struct LibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            RatingView(score: .constant(3)),
        title: "Rating Control",
            category: .control)
    }
    
    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.reszedToFill(width: 150, height: 150)
        )
    }
}

#Preview {
    VStack {
        PhotoViewModifier()
        RatingView(score: .constant(3))
    }
    
}
