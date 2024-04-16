//
//  room.swift
//  RoomsSwiftData
//
//  Created by RomTheSheep on 12/4/24.
//

import Foundation
import SwiftData
import UIKit

@Model
class Room {
    var name: String
    @Attribute(.transformable(by: UIColorTransformer.self)) var color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
