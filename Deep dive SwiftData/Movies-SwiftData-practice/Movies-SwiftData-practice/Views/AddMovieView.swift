//
//  AddMovieView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI

struct AddMovieView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var year: Int?
    @State private var genre = Genre.allCases.first!
    @State private var SelectedActors = Set<Actor>()
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace && year != nil && !SelectedActors.isEmpty
    }
    
    var body: some View {
        Form {
            Picker("Select genre", selection: $genre) {
                ForEach(Genre.allCases) { genre in
                    Text(genre.name).tag(genre)
                }
            }.pickerStyle(.segmented)
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            Section("Select Actor") {
                ActorSelectorView(selectedActors: $SelectedActors)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    guard let year else { return }
                    let movie = Movie(title: title, year: year, genre: genre)
                    movie.actors = Array(SelectedActors)
                    SelectedActors.forEach { actor in
                        actor.movies.append(movie)
                        context.insert(actor)
                    }
                    context.insert(movie)
                    dismiss()
                }.disabled(!isFormValid)
            }

            
        }
    }
}

#Preview {
    NavigationStack {
        AddMovieView()
            .modelContainer(for: [Movie.self])
    }
}
