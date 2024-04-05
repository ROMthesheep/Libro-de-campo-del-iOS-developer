//
//  MusicPlayerEffect.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 2/4/24.
//

import SwiftUI

struct MusicPlayerBar: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        HStack {
            Image("album")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(4)
                .padding()
                .matchedGeometryEffect(id: "anim", in: namespace)
            Text("Lisa")
                .font(.headline)
            Spacer()
            Image(systemName: "play.fill")
            Image(systemName: "forward.fill")
                .padding(.trailing, 10)
        }.frame(maxWidth: .infinity, maxHeight: 60)
    }
}

struct MusicPlayerView: View {
    let namespace: Namespace.ID
    var body: some View {
        VStack {
            Image("album")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
                .matchedGeometryEffect(id: "anim", in: namespace)
            HStack {
                VStack(alignment: .leading) {
                    Text("Lisa")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Young Miko")
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                }.foregroundStyle(.white)
                    .padding()
                Spacer()
            }
                HStack {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 30))
                    Image(systemName: "play.fill")
                        .font(.system(size: 50))
                        .padding([.leading, .trailing], 80)
                    Image(systemName: "forward.fill")
                        .font(.system(size: 30))
                }.foregroundStyle(.white)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray)
    }
}

struct MusicPlayerEffect: View {
    @State private var showPlayer = false
    @Namespace private var ns
    var body: some View {
        VStack {
            Spacer()
            if showPlayer {
                MusicPlayerView(namespace: ns)
            } else {
                MusicPlayerBar(namespace: ns)
            }
        }.onTapGesture {
            withAnimation(.spring()) {
                showPlayer.toggle()
            }
        }
    }
}

#Preview {
    MusicPlayerEffect()
}
