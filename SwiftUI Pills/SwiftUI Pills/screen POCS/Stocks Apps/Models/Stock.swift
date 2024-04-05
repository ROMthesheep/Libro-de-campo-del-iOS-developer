//
//  Stock.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
