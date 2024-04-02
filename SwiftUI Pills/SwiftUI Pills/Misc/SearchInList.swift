//
//  SearchInList.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 22/3/24.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> some UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
    }
}

struct SearchInList: View {
    
    @State private var searchTerm: String = ""
    
    let names = ["Ana","Lina","Almudena","Maite","Luis","Luca","Esther","Amparo","Maria","Marina","Jose","Jorge"]
    
    var body: some View {
        List {
            SearchBar(text: $searchTerm)
            ForEach(names.filter({ searchTerm.isEmpty ? true : $0.localizedStandardContains(searchTerm)}), id: \.self) { name in
                Text(name)
            }
        }
    }
}

#Preview {
    SearchInList()
}
