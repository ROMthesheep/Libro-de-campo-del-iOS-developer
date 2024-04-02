//
//  SimpleModal.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

struct SimpleModal: View {
    @State private var showModal: Bool = false
    var body: some View {
        Button("Show modal") {
            showModal.toggle()
        }
        .font(.largeTitle)
        .sheet(isPresented: $showModal, content: {
            ZStack {
                Color.gray.ignoresSafeArea(.all)
                VStack {
                    Text("I'm a modal!").font(.largeTitle)
                    Text("not much to see, but hey at least I work").font(.subheadline)
                    Text("can you say the same? how's is the release going?").font(.subheadline)
                    Button("Close Modal") {
                        showModal = false
                    }
                    .padding()
                    .foregroundStyle(.mint)
                }
                .foregroundStyle(.white)
            }
        })
    }
}

#Preview {
    SimpleModal()
}
