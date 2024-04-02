//
//  Binding Examples.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 18/3/24.
//

import SwiftUI

struct PlayIcon: View {
    @Binding var isPlaying: Bool
    var body: some View {
        Image(systemName: isPlaying ? "play.circle" : "pause.circle")
            .font(.largeTitle)
        }
}

struct PlayButton: View {
    @Binding var isPlaying: Bool
    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}

struct MusicPlayer: View {
    @State private var isPlaying: Bool = false
    var body: some View {
        VStack {
            PlayIcon(isPlaying: $isPlaying)
                .padding()
            PlayButton(isPlaying: $isPlaying)
        }
    }
}

#Preview {
    MusicPlayer()
}
