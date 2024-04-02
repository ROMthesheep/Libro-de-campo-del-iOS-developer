//
//  Item.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 18/3/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
