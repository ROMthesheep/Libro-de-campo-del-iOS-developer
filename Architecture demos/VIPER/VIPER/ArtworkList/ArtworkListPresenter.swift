//
//  ArtworkListPresenter.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation

protocol ArtworkListViewDelegate: AnyObject {
    func update(artworks: [ViewModel])
}

class ArtworkListPresenter {
    weak var uiDelegate: ArtworkListViewDelegate?
    private let interactor: ArtWorklistInteractable
    private var models: [ArtWorkModel] = []
    var viewmodels: [ViewModel] = []
    private let router: ListRouting
    
    init(interactor: ArtWorklistInteractor, router: ListRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func onViewAppear() {
        Task {
            do {
                models = try await interactor.getArtworks(page: 3).data
                viewmodels = models.map { entity in
                    ViewModel(imageURL: entity.imageURL, title: entity.title, date: "\(entity.dateStart)-\(entity.dateEnd)", artistName: entity.artistTitle ?? "")
                }
                uiDelegate?.update(artworks: viewmodels)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func cellPressed(at index: Int) {
        router.showArtWorkDetail(artworkId: models[index].id)
    }
}
