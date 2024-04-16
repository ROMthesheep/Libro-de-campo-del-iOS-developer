//
//  Actor.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import Foundation
import SwiftData

@Model
final class Actor {
    var name: String
    var movies = [Movie]()
    
    init(name: String) {
        self.name = name
    }
}
