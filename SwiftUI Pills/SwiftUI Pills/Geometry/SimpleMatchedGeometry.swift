//
//  SimpleMatchedGeometry.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 2/4/24.
//

import SwiftUI

struct SimpleMatchedGeometry: View {
    @State private var isSwitched = true
    @Namespace private var ns
    var body: some View {
        HStack(alignment: .center) {
            if !isSwitched {
                Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
                    .matchedGeometryEffect(id: "bolas", in: ns)
            }
            
            Spacer()
            
            Button("Switch") {
                withAnimation {
                    isSwitched.toggle()
                }
            }
            Spacer()
            VStack {
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                
                if isSwitched {
                    Circle()
                        .fill(Color.green)
                        .matchedGeometryEffect(id: "bolas", in: ns)
                }
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                
            }
            
        }.padding()
    }
}

#Preview {
    SimpleMatchedGeometry()
}
