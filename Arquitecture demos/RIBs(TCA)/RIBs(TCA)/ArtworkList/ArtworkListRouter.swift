//
//  ArtworkListRouter.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import RIBs

protocol ArtworkListInteractable: Interactable, ArtworkDetailListener {
    var router: ArtworkListRouting? { get set }
    var listener: ArtworkListListener? { get set }
}

protocol ArtworkListViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class ArtworkListRouter: LaunchRouter<ArtworkListInteractable, ArtworkListViewControllable>, ArtworkListRouting {
    
    private let artworkDetailBuilder: ArtworkDetailBuildable

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: ArtworkListInteractable,
                  viewController: ArtworkListViewControllable,
                  artworkDetailBuilder: ArtworkDetailBuildable) {
        self.artworkDetailBuilder = artworkDetailBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToDetail(artwork: ArtWorkModel) {
        let artworkDetail = artworkDetailBuilder.build(withListener: interactor, data: artwork)
        attachChild(artworkDetail)
        viewController.present(viewController: artworkDetail.viewControllable)
    }
}
