//
//  HideSentitiveData - Redacted.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 2/4/24.
//

import SwiftUI

struct HideSentitiveData: View {
    
    @State private var isRedacted: Bool = true
    
    var body: some View {
        VStack(spacing: 10) {
            Toggle(isOn: $isRedacted, label: {
                Text("Redacted")
            })
            Spacer()
            Text("Señor Señor")
            HStack {
                Text("DNI")
                Text("44640995L")
                    .redacted(reason: isRedacted ? .placeholder : [])
                    .onTapGesture {
                        isRedacted.toggle()
                    }
            }
            HStack {
                Text("Telefono")
                Text("687687687")
                    .redacted(if: isRedacted)
            }
            Spacer()
        }.padding()
    }
}

// Custom version
extension View {
    @ViewBuilder
    func redacted(if condition: @autoclosure () -> Bool, style: RedactionReasons = .placeholder) -> some View {
        redacted(reason: condition() ? .placeholder : [])
    }
}

#Preview {
    HideSentitiveData()
}
