//
//  ReviewListView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import SwiftUI

struct ReviewListView: View {
    @Environment(\.modelContext) private var context
    let movie: Movie
    
    private func deleteRow(indexSet: IndexSet) {
        indexSet.forEach { index in
            context.delete(movie.reviews[index]).self
            movie.reviews.remove(at: index)
        }
    }
    
    var body: some View {
        List {
            ForEach(movie.reviews) { review in
                VStack(alignment: .leading) {
                    Text(review.user)
                    Text(review.body)
                }
            }.onDelete(perform: deleteRow)
        }
    }
}
