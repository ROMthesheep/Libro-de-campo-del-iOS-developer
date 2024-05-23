//
//  ArtworkDetailViewModel.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation

struct ArtworkDetailViewModel {
    let title: String
    let date: String
    let artistDisplay, placeOfOrigin: String
    let description, shortDescription: String?
    let dimensions: String
    let mediumDisplay: String
    let artistTitle: String?
    let imageID: String
    
    var imageURL: String {
        "https://www.artic.edu/iiif/2/\(imageID)/full/843,/0/default.jpg"
    }
}
