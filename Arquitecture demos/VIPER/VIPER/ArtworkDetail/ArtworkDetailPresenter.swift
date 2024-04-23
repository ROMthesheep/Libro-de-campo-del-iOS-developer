//
//  ArtworkDetailPresenter.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation

protocol ArtworkDetailViewDelegate: AnyObject {
    func update(viewmodel: ArtworkDetailViewModel)
}

protocol ArtworkDetailPresentable: AnyObject {
    var uiDelegate: ArtworkDetailViewDelegate? { get }
    var movieID: Int { get }
    func onViewAppear()
}

class ArtworkDetailPresenter: ArtworkDetailPresentable {
    let movieID: Int
    private let interactor: ArtworkDetailInteractor
    private let mapper: ArtworkDetailMapper
    weak var uiDelegate: ArtworkDetailViewDelegate?
    
    init(movieID: Int, interactor: ArtworkDetailInteractor, mapper: ArtworkDetailMapper) {
        self.movieID = movieID
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            do {
                let artwork = try await interactor.getDetailMovie(withId: self.movieID).data
                let viewmodel = mapper.map(entity: artwork)
                await MainActor.run {
                    self.uiDelegate?.update(viewmodel: viewmodel)
                }
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
