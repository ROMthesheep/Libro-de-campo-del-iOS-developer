//
//  AddReviewView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import SwiftUI

struct AddReviewView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var user = ""
    @State private var description = ""
    
    let movie: Movie

    private var isFormValid: Bool {
        !user.isEmptyOrWhiteSpace && !description.isEmptyOrWhiteSpace
    }
    
    var body: some View {
        Form {
            TextField("User", text: $user)
            TextField("Body", text: $description)
        }.navigationTitle("Add Review")
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let review = Review(user: user, body: description)
                        review.movie = movie
                        context.insert(review)
                        movie.reviews.append(review)
                        dismiss()
                    }.disabled(!isFormValid)
                }
                
            }
    }
}
