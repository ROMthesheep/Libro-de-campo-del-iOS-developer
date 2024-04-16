//
//  UIColorTransformer.swift
//  RoomsSwiftData
//
//  Created by RomTheSheep on 12/4/24.
//

import Foundation
import UIKit

class UIColorTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }
        do {
            return try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
        } catch {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
        } catch {
            return nil
        }
    }
}
