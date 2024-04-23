//
//  ArtworkListRouter.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation
import UIKit

protocol ListRouting: AnyObject {
    var detailRouter: DetailRouting? { get }
    var hostViewController: ArtworkListView? { get }
    func showArtWorkList(window: UIWindow?)
    func showArtWorkDetail(artworkId: Int)
}

class ArtworkListRouter: ListRouting {
    var detailRouter: DetailRouting?
    var hostViewController: ArtworkListView?
    
    func showArtWorkList(window: UIWindow?) {
        self.detailRouter = ArtworkDetailRouter()
        let interactor = ArtWorklistInteractor()
        let presenter = ArtworkListPresenter(interactor: interactor, router: self)
        hostViewController = ArtworkListView(presenter: presenter)
        presenter.uiDelegate = hostViewController
        
        window?.rootViewController = hostViewController
        window?.makeKeyAndVisible()
    }
    
    func showArtWorkDetail(artworkId: Int) {
        guard let hostViewController else { return }
        detailRouter?.showDetail(from: hostViewController, withID: artworkId)
        print("vamonos a \(artworkId)")
    }
}
