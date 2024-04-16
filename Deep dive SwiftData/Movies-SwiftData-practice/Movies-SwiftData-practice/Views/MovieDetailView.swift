//
//  MovieDetailView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import SwiftUI
import SwiftData

struct MovieDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title = ""
    @State private var year: Int?
    @State private var showAddReview = false
    
    let movie: Movie
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            Button("Update") {
                guard let year else { return }
                movie.year = year
                movie.title = title
                context.safeSave()
                dismiss()
            }.buttonStyle(.borderless)
            
            Section("Reviews") {
                Button(action: { showAddReview = true }, label: {
                    Image(systemName: "plus")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                if movie.reviews.isEmpty {
                    ContentUnavailableView {
                        Text("No Reviews")
                    }
                } else {
                    ReviewListView(movie: movie)
                }
            }
            
            Section("Actors") {
                List(movie.actors) { actor in
                    ActorCellView(actor: actor)
                }
            }
        }.onAppear {
            title = movie.title
            year = movie.year
        }.sheet(isPresented: $showAddReview, content: {
            NavigationStack {
                AddReviewView(movie: movie)
            }
        })
    }
}

struct MovieDetailContainerView: View {
    @Environment(\.modelContext) private var context
    @State private var movie: Movie?
    
    var body: some View {
        ZStack {
            if let movie {
                MovieDetailView(movie: movie)
            }
        }
            .onAppear {
                movie = Movie(title: "Dune 2 ahora es personal", year: 2024, genre: .action)
                context.insert(movie!)
            }
    }
}

#Preview {
    MovieDetailContainerView()
        .modelContainer(for: [Movie.self])
}
