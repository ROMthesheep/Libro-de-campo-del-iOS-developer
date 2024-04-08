//
//  FilmSearchMainView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI

struct FilmSearchMainView: View {
    
    @StateObject private var filmListVM = FilmListViewModel()
    @State private var searchQuery: String = ""
    
    var body: some View {
        NavigationStack {
            List(filmListVM.films, id: \.id) { film in
                HStack {
                    AsyncImage(url: film.poster) { Image in
                        Image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(film.title)
                }
            }.listStyle(.plain)
                .searchable(text: $searchQuery) 
                .onChange(of: searchQuery) { oldValue, newValue in
                    Task.init {
                        if newValue.count > 3 {
                            await filmListVM.search(query: newValue)
                        } else {
                            filmListVM.films.removeAll()
                        }
                    }
                }
        }
    }
}

#Preview {
    FilmSearchMainView()
}
