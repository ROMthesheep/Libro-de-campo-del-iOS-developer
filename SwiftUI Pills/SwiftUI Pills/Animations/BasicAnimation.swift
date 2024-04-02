//
//  BasicAnimation.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import SwiftUI

struct BasicAnimation: View {
    
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button("Press me") {
                showDetails.toggle()
            }
            
            HStack {
                Text(showDetails ? "Hide Details" : "Show Details")
                Image(systemName: "chevron.up.square")
                    .rotationEffect(.degrees(showDetails ? 0 : 180+360))
                    .animation(.default)
            }
        }
    }
}

#Preview {
    BasicAnimation()
}
