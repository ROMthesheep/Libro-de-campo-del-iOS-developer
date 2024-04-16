//
//  Genre.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 11/4/24.
//

import Foundation

enum Genre: Int, Codable, CaseIterable, Identifiable {
    case action = 1
    case horror
    case kids
    case fiction
    case comedy
    case romantic
    
    var id: Int {
        rawValue
    }
}

extension Genre {
    var name: String {
        switch self {
        case .action:
            return "Action"
        case .horror:
            return "Horror"
        case .kids:
            return "Kids"
        case .fiction:
            return "Fiction"
        case .comedy:
            return "Comedy"
        case .romantic:
            return "Romantic"
        }
    }
}
