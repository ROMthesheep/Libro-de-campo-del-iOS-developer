//
//  Comunication between modal and host.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

struct FlagViewModel {
    var showModal: Bool = false
    var selectedFlag: String = "🏴‍☠️"
    var country: String = ""
}

struct Comunication_between_modal_and_host: View {
    
    @State private var flagVM: FlagViewModel = FlagViewModel()
 
    let flags = ["🇦🇹", "🇩🇪", "🇦🇲", "🇧🇳", "🇨🇰", "🇩🇰"]
     
    var body: some View {
        List {
            Text(flagVM.country)
            ForEach(Array(zip(flags.indices, flags)), id: \.0) { flagIndex, flag in
                HStack {
                    Text(flag)
                        .font(.custom("Arial", size: 80))
                    Text("Flag \(flagIndex)")
                }.onTapGesture {
                    self.flagVM.selectedFlag = flag
                    self.flagVM.showModal.toggle()
                }
            }
        }.sheet(isPresented: $flagVM.showModal) {
            VStack {
                FlagView(flagVM: $flagVM)
            }
            
        }
    }
}
 
struct FlagView: View {
    @Binding var flagVM: FlagViewModel
    var body: some View {
        VStack {
            Text(flagVM.selectedFlag).font(.custom("Arial", size: 250))
            TextField("Enter country name", text: $flagVM.country)
                .padding()
                .fixedSize()
            
            Button("Submit") {
                flagVM.showModal.toggle()
            }
            
        }
    }
}

#Preview {
    Comunication_between_modal_and_host()
}
