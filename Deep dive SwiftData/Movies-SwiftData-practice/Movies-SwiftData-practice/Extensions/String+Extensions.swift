//
//  String+Extensions.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 8/4/24.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
}
