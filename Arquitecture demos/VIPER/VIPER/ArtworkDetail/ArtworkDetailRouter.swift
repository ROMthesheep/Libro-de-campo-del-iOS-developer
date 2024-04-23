//
//  ArtworkDetailRouter.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject {
    func showDetail(from: UIViewController, withID movieID: Int)
}

class ArtworkDetailRouter: DetailRouting {
    func showDetail(from: UIViewController, withID movieID: Int) {
        let interactor = ArtworkDetailInteractor()
        let presenter = ArtworkDetailPresenter(movieID: movieID, interactor: interactor, mapper: ArtworkDetailMapper())
        let view = ArtworkDetailView(presenter: presenter)
        presenter.uiDelegate = view
        
        from.present(view, animated: true)
    }
}
