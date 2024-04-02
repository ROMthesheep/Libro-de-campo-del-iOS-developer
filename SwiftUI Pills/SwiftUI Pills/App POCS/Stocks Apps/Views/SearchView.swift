//
//  SearchView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchTerm)
                .foregroundStyle(.primary)
                .padding(10)
            Spacer()
        }.foregroundStyle(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .padding(10)
    }
}

#Preview {
    SearchView(searchTerm: .constant(""))
}
