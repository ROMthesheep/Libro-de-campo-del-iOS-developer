//
//  MovieSelectionView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 10/4/24.
//

import SwiftUI
import SwiftData

struct MovieSelectionView: View {
    
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Binding var selectedMovies: Set<Movie>
    
    var body: some View {
        List(movies) { movie in
            HStack {
                Image(systemName: selectedMovies.contains(movie) ? "checkmark.square" : "square")
                Text(movie.title)
            }.onTapGesture {
                if selectedMovies.contains(movie) {
                    selectedMovies.remove(movie)
                } else {
                    selectedMovies.insert(movie)
                }
            }
        }
    }
}

