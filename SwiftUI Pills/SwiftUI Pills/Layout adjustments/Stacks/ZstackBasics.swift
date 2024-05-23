//
//  ZstackBasics.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 23/5/24.
//

import SwiftUI

struct ZstackBasics: View {
    var body: some View {
            ZStack(alignment: .bottom) {
            Image("thispersondoesnotexist")
                .resizable()
                .aspectRatio(contentMode: .fit)
                HStack {
                    Image(systemName: "person.text.rectangle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Doña que no existe")
                            .font(.headline)
                        Text("CEO de no existir")
                            .font(.subheadline)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.primary.opacity(0.6))
        }
    }
}

#Preview {
    ZstackBasics()
}
