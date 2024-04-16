//
//  ModelContext+Extension.swift
//  Movies-SwiftData-practice
//
//  Created by RomTheSheep on 9/4/24.
//

import Foundation
import SwiftData

extension ModelContext {
    func safeSave() {
        do {
            try self.save()
        } catch {
            fatalError()
        }
    }
}
