//
//  FilterSelectionView.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 10/4/24.
//

import SwiftUI

enum FilterOption {
    case title(String)
    case reviewCount(Int)
    case genre(Genre)
    case none
}

struct FilterSelectionView: View {
    @Environment(\.dismiss) private var dismiss
//    @State private var title: String = ""
//    @State private var numberOfReviews: Int?
//    @State private var genre: Genre?
    @Binding var filterConfig: FilterConfiguration
    
    var body: some View {
        Form {
            Section("Filter by title") {
                TextField("Movie Title", text: $filterConfig.movieTitle)
                HStack {
                    Button("Filter") {
                        filterConfig.filter = filterConfig.movieTitle.isEmptyOrWhiteSpace ? .none : .title(filterConfig.movieTitle)
                        dismiss()
                    }
                }
            }
            Section("Filter by number of reviews") {
                TextField("number of reviews", value: $filterConfig.numberOfReviews, format: .number).keyboardType(.numberPad)
                HStack {
                    Button("Filter") {
                        filterConfig.filter = filterConfig.numberOfReviews == nil ? .none : .reviewCount(filterConfig.numberOfReviews!)
                        dismiss()
                    }
                }
            }
            Section("Filter by Genre") {
                Picker("Genre", selection: $filterConfig.genre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name).tag(genre)
                    }
                }.onChange(of: filterConfig.genre) { oldValue, newValue in
                    filterConfig.filter = .genre(filterConfig.genre)
                    dismiss()
                }
            }
            
        }.toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Delete Filter", role: .destructive) {
                    filterConfig.filter = .none
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FilterSelectionView(filterConfig: .constant(FilterConfiguration()))
    }
}
