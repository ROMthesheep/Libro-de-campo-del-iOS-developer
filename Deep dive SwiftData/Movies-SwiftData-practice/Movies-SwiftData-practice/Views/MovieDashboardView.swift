//
//  MovieListView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI
import SwiftData

enum DashboardSheets: Identifiable {
    case addMovie, addActor, ShowFilter
    var id: Int {
        hashValue
    }
}

struct FilterConfiguration {
    var movieTitle: String = ""
    var numberOfReviews: Int?
    var genre: Genre = .action
    var filter: FilterOption = .none
}

struct MovieDashboardView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    
    @State private var actorName: String = ""
    @State private var activeSheet: DashboardSheets?
    @State private var filterConfiguration = FilterConfiguration()
    
    private func saveActor() {
        let actor = Actor(name: actorName)
        context.insert(actor)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("Movies")
                    .font(.largeTitle)
                Spacer()
                Button("Filter", action: { activeSheet = .ShowFilter })
            }
            MovieListView(filterOption: filterConfiguration.filter)
            ActorListView(actors: actors)
        }
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    activeSheet = .addMovie
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("Add Actor") {
                    activeSheet = .addActor
                }
            }
            
        })
        .sheet(item: $activeSheet, content: { sheet in
            NavigationStack {
                switch sheet {
                case .addMovie:
                    AddMovieView()
                case .addActor:
                    Text("Add Actor")
                        .font(.title)
                    TextField("Actor Name", text: $actorName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Button("Save") {
                        saveActor()
                    }
                    .presentationDetents([.fraction(0.25)])
                case .ShowFilter:
                    FilterSelectionView(filterConfig: $filterConfiguration)
                }
            }
        })
    }
}

#Preview {
    NavigationStack {
        MovieDashboardView()
            .modelContainer(for: [Movie.self, Review.self, Actor.self])
    }
}
