//
//  ArtworkListViewModel.swift
//  MVVM
//
//  Created by RomTheSheep on 23/4/24.
//

import Foundation
import Combine

class ArtworkListViewModel {
    let client: Client
    @Published var artworks = [ArtWorkModel]()
    let selectedArtwork = PassthroughSubject<ArtWorkModel, Never>()
    private var cancelables = Set<AnyCancellable>()
    
    init(client: Client) {
        self.client = client
        itemWasSelected()
    }
    
    func itemWasSelected() {
        selectedArtwork.sink { model in
            print(model)
        }.store(in: &cancelables)
    }
    
    func fetchArtworks() {
        Task {
            do {
                artworks = try await client.getArtworks().data
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
