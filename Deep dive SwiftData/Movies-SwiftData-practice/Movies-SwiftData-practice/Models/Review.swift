//
//  Review.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import Foundation
import SwiftData

@Model
final class Review {
    var user: String
    var body: String
    var movie: Movie?
    
    init(user: String, body: String) {
        self.user = user
        self.body = body
    }
}
