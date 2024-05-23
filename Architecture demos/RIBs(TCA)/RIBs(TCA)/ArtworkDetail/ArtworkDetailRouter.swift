//
//  ArtworkDetailRouter.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import RIBs

protocol ArtworkDetailInteractable: Interactable {
    var router: ArtworkDetailRouting? { get set }
    var listener: ArtworkDetailListener? { get set }
}

protocol ArtworkDetailViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ArtworkDetailRouter: ViewableRouter<ArtworkDetailInteractable, ArtworkDetailViewControllable>, ArtworkDetailRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ArtworkDetailInteractable, viewController: ArtworkDetailViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
