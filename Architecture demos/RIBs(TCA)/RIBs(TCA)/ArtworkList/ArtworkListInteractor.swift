//
//  ArtworkListInteractor.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import RIBs
import RxSwift

protocol ArtworkListRouting: ViewableRouting {
    func routeToDetail(artwork: ArtWorkModel)
}

protocol ArtworkListPresentable: Presentable {
    var listener: ArtworkListPresentableListener? { get set }
    func updateTable(artworks: [ArtWorkModel])
}

protocol ArtworkListListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ArtworkListInteractor: PresentableInteractor<ArtworkListPresentable>, ArtworkListInteractable, ArtworkListPresentableListener {

    weak var router: ArtworkListRouting?
    weak var listener: ArtworkListListener?

    private let client = Client()
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ArtworkListPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        Task {
            do {
                let artworks = try await client.getArtworks().data
                presenter.updateTable(artworks: artworks)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func rowSelected(artwork: ArtWorkModel) {
        router?.routeToDetail(artwork: artwork)
    }
}
