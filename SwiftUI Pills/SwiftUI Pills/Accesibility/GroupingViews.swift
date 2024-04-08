//
//  GroupingViews.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI

struct GroupingViews: View {
    var body: some View {
        VStack(spacing: 80) {
            HStack {
                Text("Esta vista esta bien agrupada")
                Spacer()
                VStack(spacing: 10) {
                    Text("Ir a la cesta")
                    Image(systemName: "cart")
                }.accessibilityElement(children: .combine)
            }
            HStack {
                Text("Esta vista esta mal agrupada")
                Spacer()
                VStack(spacing: 10) {
                    Text("Ir a la cesta")
                    Image(systemName: "cart")
                }
            }
        }.padding()
    }
}

#Preview {
    GroupingViews()
}
