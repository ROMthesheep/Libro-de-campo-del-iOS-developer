//
//  ArtworkDetailPushCoordinator.swift
//  MVC-C
//
//  Created by Luca Lago on 19/4/24.
//

import Foundation
import UIKit

final class ArtworkDetailPushCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var artwork: ArtworkDetailModel
    
    init(navigationController: UINavigationController?, artwork: ArtworkDetailModel) {
        self.navigationController = navigationController
        self.artwork = artwork
    }
    
    func start() {
        let artworkDetailViewController = ArtworkDetailViewcontroller(for: artwork)
        navigationController?.pushViewController(artworkDetailViewController, animated: true)
    }
}
