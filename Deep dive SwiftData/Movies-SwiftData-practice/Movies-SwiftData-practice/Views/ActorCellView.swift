//
//  ActorCellView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import SwiftUI

struct ActorCellView: View {
    
    let actor: Actor
    
    
    var body: some View {
        let actorMovies = actor.movies.map({$0.title}).formatted(.list(type: .and).locale(.current))
        return VStack(alignment: .leading) {
            Text(actor.name)
            Text(actorMovies).font(.caption)
        }
    }
}

//#Preview {
//    ActorCellView()
//}
