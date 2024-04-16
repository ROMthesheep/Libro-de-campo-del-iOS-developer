//
//  ActorListView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import SwiftUI

struct ActorListView: View {
    let actors: [Actor]
    var body: some View {
        List(actors) { actor in
            NavigationLink(value: actor) {
                ActorCellView(actor: actor)
            }
        }.navigationDestination(for: Actor.self) { actor in
            ActorDetailScreen(actor: actor)
        }
    }
}
