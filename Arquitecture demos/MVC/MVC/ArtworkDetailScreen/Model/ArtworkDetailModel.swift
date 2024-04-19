//
//  ArtworkDetailModel.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation

struct ArtworkDetailModel {
    let title: String
    let artistName: String?
    let dateStart, dateEnd: Int
    let dateDisplay: String
    let description, shortDescription: String?
    let dimensions: String
    let dimensionsDetail: [DimensionsDetail]
    var imageURL: String
    
    
    /// Parser for detailScreen
    /// - Parameter artwork: input data
    init(for artwork: ArtWorkModel) {
        self.title = artwork.title
        self.artistName = artwork.artistTitle
        self.dateStart = artwork.dateStart
        self.dateEnd = artwork.dateEnd
        self.dateDisplay = artwork.dateDisplay
        self.description = artwork.description
        self.shortDescription = artwork.shortDescription
        self.dimensions = artwork.dimensions
        self.dimensionsDetail = artwork.dimensionsDetail
        self.imageURL = artwork.imageURL
    }
}
