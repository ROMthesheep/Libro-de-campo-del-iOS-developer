//
//  ActorSelectorView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import SwiftUI
import SwiftData

struct ActorSelectorView: View {
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    @Binding var selectedActors: Set<Actor>
    
    var body: some View {
        List(actors) { actor in
            HStack {
                Image(systemName: selectedActors.contains(actor) ? "checkmark.square" : "square")
                Text(actor.name)
            }.onTapGesture {
                if selectedActors.contains(actor) {
                    selectedActors.remove(actor)
                } else {
                    selectedActors.insert(actor)
                }
            }
        }
    }
}

//#Preview {
//    ActorSelectorView()
//}
