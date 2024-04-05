//
//  CreditrCardViewer.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 2/4/24.
//

import SwiftUI

struct CreditrCardViewer: View {
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
    @State private var name: String = ""
    @State private var expires: String = ""
    @State private var cvv: String = ""
    
    var body: some View {
        VStack {
            CreditCard {
                VStack {
                    Group {
                        if flipped {
                            CreditCardBack(cvv: cvv)
                        } else {
                            CreditCardFront(name: name, expires: expires)
                        }
                    }
                }.rotation3DEffect(.degrees(degrees),axis: (x: 0.0, y: 1.0, z: 0.0))
            }.onTapGesture {
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
        }
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            TextField("Expiration", text: $expires)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            
            TextField("CVV", text: $cvv) { (editingChanged) in
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
            } onCommit: {}
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
            
        }
    }
}

#Preview {
    CreditrCardViewer()
}
