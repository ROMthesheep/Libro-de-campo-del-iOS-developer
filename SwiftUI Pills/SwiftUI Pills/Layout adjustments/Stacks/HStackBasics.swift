//
//  HStackBasics.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 23/5/24.
//

import SwiftUI

struct HStackBasics: View {
    @State var streched = false
    var body: some View {
        HStack(alignment: .center, spacing: streched ? 25 : 15) {
            ForEach(0..<5) {index in
                Text("\(index)")
            }
        }
        .onAppear { // esta parte es solo para ver como afecta el spacing al stack y para que se compruebe que no se puede hacer scroll
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(), { streched.toggle() })
        }
    }
}

#Preview {
    HStackBasics()
}
