//
//  ActorDetailScreen.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 10/4/24.
//

import SwiftUI

struct ActorDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    
    let actor: Actor
    @State private var selectedMovies: Set<Movie> = []
    
    var body: some View {
        VStack {
            MovieSelectionView(selectedMovies: $selectedMovies)
                .onAppear {
                    selectedMovies = Set(actor.movies)
                }
                .onChange(of: selectedMovies) { oldValue, newValue in
                    actor.movies = Array(selectedMovies)
                    context.insert(actor)
                }
        }.navigationTitle(actor.name)
    }
}
