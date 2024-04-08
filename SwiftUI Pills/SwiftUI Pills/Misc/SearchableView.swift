//
//  SearchableView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI

struct SearchableView: View {
    
    let names: [String] = ["Lucía" ,"Sofía" ,"Martina" ,"Valeria" ,"María" ,"Julia" ,"Paula" ,"Emma" ,"Olivia" , "Daniel" , "Carla" , "Alma" , "Mía" , "Carmen" , "Vega" , "Lola" , "Lara" , "Sara" , "Alba", "Jimena", "Martín", "Mateo", "Hugo", "Leo", "Lucas", "Manuel", "Alejandro", "Pablo", "Danie", "Álvaro", "Enzo", "Adrián", "Lucas", "Diego", "Thiago", "Mario", "Bruno", "David", "Olive", "Alex"]
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            List(names, id: \.self) { name in
                Text(name)
            }
        }.searchable(text: $text) {
            ForEach(names.filter { $0.hasPrefix(text) }, id: \.self) { name in
                Text(name)
            }
        }.onSubmit {
            // Se ha buscado
        }
    }
}

#Preview {
    SearchableView()
}
