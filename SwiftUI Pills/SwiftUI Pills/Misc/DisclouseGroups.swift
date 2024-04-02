//
//  DisclouseGroups.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 1/4/24.
//

import SwiftUI

struct DisclouseGroups: View {
    @State private var isExpanded: Bool = true
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            ForEach(1...5, id: \.self) {_ in 
                Text("blablablablbla")
            }
        } label: {
            Text("Thing")
        }.padding()
    }
}

#Preview {
    DisclouseGroups()
}
