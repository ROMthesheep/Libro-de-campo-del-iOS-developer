//
//  MainCoordinator.swift
//  MVC-C
//
//  Created by Luca Lago on 19/4/24.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let artworkListVC = storyboard.instantiateViewController(withIdentifier: "ArtworkListViewController")
        navigationController?.pushViewController(artworkListVC, animated: true)
    }
}
