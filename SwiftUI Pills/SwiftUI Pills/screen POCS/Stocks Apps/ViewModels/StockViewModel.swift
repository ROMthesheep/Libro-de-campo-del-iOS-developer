//
//  StockViewModel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import Foundation

struct StockViewModel {
    let stock: Stock
    
    var symbol: String {
        stock.symbol.uppercased()
    }
    
    var description: String {
        stock.description
    }
    
    var price: String {
        String(format: "%.2f", stock.price)
    }
    
    var change: String {
        stock.change
    }
    
}
