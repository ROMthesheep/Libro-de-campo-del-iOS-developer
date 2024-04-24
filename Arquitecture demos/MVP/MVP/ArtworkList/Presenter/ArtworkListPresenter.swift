//
//  ArtworkListPresenter.swift
//  MVP
//
//  Created by RomTheSheep on 24/4/24.
//

import Foundation

protocol ListPresenterProtocol {
    func viewLoaded()
    func getArtworksCount() -> Int
    func getArtwork(for index: Int) -> ArtWorkModel
}

class ArtworkListPresenter: ListPresenterProtocol {
    var artworks = [ArtWorkModel]()
    private var modelDataBase = ArtworkDataBase()
    private let client = Client()
    weak var view: ListViewProtocol?
    
    private func fetchArtWorks() {
        Task {
            do {
                artworks = try await client.getArtworks().data
                view?.mostrarDatos()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func viewLoaded() {
        fetchArtWorks()
    }
    
    func getArtworksCount() -> Int {
        artworks.count
    }
    
    func getArtwork(for index: Int) -> ArtWorkModel {
        artworks[index]
    }
}
