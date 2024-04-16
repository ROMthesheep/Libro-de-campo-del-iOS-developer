//
//  MovieListView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    @Environment(\.modelContext)  private var context
    
    @Query private var movies: [Movie]
    let filterOption: FilterOption
    
    init(filterOption: FilterOption = .none) {
        self.filterOption = filterOption
        switch filterOption {
        case .title(let title):
            _movies = Query(filter: #Predicate { $0.title.contains(title) } )
        case .reviewCount(let numberOfReviews):
            _movies = Query(filter: #Predicate { $0.reviews.count >=  numberOfReviews})
        case .genre(let targetGenre):
            _movies = Query(filter: #Predicate { $0.genreId == targetGenre.id })
        case .none:
            _movies = Query()
        }
    }
    
    private func deleteMovie(indexSet: IndexSet) {
        indexSet.forEach { index in
            context.delete(movies[index]).self
            context.safeSave()
        }
    }
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: movie) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(movie.title)
                            Text(movie.genre.name).font(.caption)
                            Text("Number of reviews: \(movie.reviewCount)").font(.caption)
                            Text("Number of actors: \(movie.actorsCount)").font(.caption)
                        }
                        Spacer()
                        Text("\(movie.year)")
                    }
                }
            }.onDelete(perform: deleteMovie)
        }.navigationDestination(for: Movie.self) { movie in
            MovieDetailView(movie: movie)
        }
    }
}

#Preview {
    MovieListView(filterOption: .none)
        .modelContainer(for: [Movie.self])
}
