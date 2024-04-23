//
//  ArtworkDetailModalCoordinator.swift
//  MVC-C
//
//  Created by Luca Lago on 19/4/24.
//

import Foundation
import UIKit

final class ArtworkDetailModalCoordinator: Coordinator {
    var viewcontroller: UIViewController?
    var artwork: ArtworkDetailModel
    
    init(viewcontroller: UIViewController?, artwork: ArtworkDetailModel) {
        self.viewcontroller = viewcontroller
        self.artwork = artwork
    }
    
    func start() {
        let artworkDetailViewController = ArtworkDetailViewcontroller(for: artwork)
        viewcontroller?.present(artworkDetailViewController, animated: true)
    }
}
