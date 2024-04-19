//
//  ArtworkListTableViewDelegate.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation
import UIKit

final class ArtworkListTableViewDelegate: NSObject, UITableViewDelegate {
    var tappedCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tappedCell?(indexPath.row)
    }
}
