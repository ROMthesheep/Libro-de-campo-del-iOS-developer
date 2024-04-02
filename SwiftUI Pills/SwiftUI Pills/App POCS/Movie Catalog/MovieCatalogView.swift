//
//  MovieCatalogView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 1/4/24.
//

import SwiftUI

struct MovieCatalogView: View {
    @ObservedObject var store: MovieStore
    var searchTerm: String = "avatar"
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns) {
                        ForEach(store.movies ?? [Movie](), id: \.imdbID) { movie in
                            NavigationLink(destination: {
                                Text(movie.title)
                            }, label: {
                                VStack {
                                    URLImage(url: movie.poster)
                                        .frame(width: 100, height: 150)
                                    Text(movie.title)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                }
                            })
                        }
                    }.onAppear {
                        store.fetchMovies(searchTerm: searchTerm)
                }
                }
            }
        }.navigationTitle("Movies")
    }
}

#Preview {
    NavigationStack {
        MovieCatalogView(store: MovieStore())
    }
}
