//
//  FilteringListSearchable.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 18/3/24.
//

import SwiftUI

struct FilteringListSearchable: View {
    @State private var search: String = String()
    @State private var friends:  [String] = ["Maite", "Luis", "Esther", "Almu", "Ana", "Chiara", "Carlos"]
    
    @State private var filteredFirends: [String] = [String]()
    
    var body: some View {
        VStack {
            List(filteredFirends, id: \.self) { friend in
                Text(friend)
            }
            .listStyle(.plain)
            .searchable(text: $search, placement: .automatic)
            .onChange(of: search) {
                filteredFirends = search.isEmpty ? friends : friends.filter({ $0.contains(search) })
            }
            Spacer()
        }.padding()
            .onAppear(perform: {
                filteredFirends = friends
            })
            .navigationTitle("Friends")
    }
}

#Preview {
    NavigationStack {
        FilteringListSearchable()
    }
}
