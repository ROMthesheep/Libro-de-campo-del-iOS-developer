//
//  ArtworkDetailMapper.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation

struct ArtworkDetailMapper {
    func map(entity: ArtworkDetailModel) -> ArtworkDetailViewModel {
        ArtworkDetailViewModel(title: entity.title,
                               date: "artwork crafted from \(entity.dateStart) to \(entity.dateEnd)",
                               artistDisplay: entity.artistDisplay,
                               placeOfOrigin: entity.placeOfOrigin,
                               description: entity.description,
                               shortDescription: entity.shortDescription,
                               dimensions: entity.dimensions,
                               mediumDisplay: entity.mediumDisplay,
                               artistTitle: entity.artistTitle,
                               imageID: entity.imageID)
    }
}
