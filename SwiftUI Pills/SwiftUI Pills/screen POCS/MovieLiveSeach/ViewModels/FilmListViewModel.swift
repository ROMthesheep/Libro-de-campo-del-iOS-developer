//
//  FilmListViewModel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import Foundation

class FilmListViewModel: ObservableObject {
    @Published var films = [MovieViewModel]()
    
    func search(query: String) async {
        do {
            let films = try await FilmWebService().getFilms(for: query)
            self.films = films.map(MovieViewModel.init)
        } catch {
            fatalError()
        }
    }
}

struct MovieViewModel {
    let film: Film
    var id: String {
        film.id
    }
    var title: String {
        film.title
    }
    var poster: URL? {
        URL(string: film.poster)
    }
}
