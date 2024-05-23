//
//  VStackBasics.swift
//  SwiftUI Pills
//
//  Created by Luca Lago on 23/5/24.
//

import SwiftUI

struct VStackBasics: View {
    @State var streched = false
    var body: some View {
        VStack(alignment: .center, spacing: streched ? 15 : 5) {
            Text("Fijate que los stacks NO tienen scroll, para eso hay que embeberlo en un scrollview")
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            ForEach(0..<20) {index in
                Text("item numero \(index)")
            }
        }
        .onAppear { // esta parte es solo para ver como afecta el spacing al stack y para que se compruebe que no se puede hacer scroll
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(), { streched.toggle() })
        }
    }
}

#Preview {
    VStackBasics()
}
