//
//  ArtworkDetailModel.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation

class ArtworkDetailModel: Decodable {
    let id: Int
    let title: String
    let dateStart, dateEnd: Int
    let artistDisplay, placeOfOrigin: String
    let description, shortDescription: String?
    let dimensions: String
    let mediumDisplay: String
    let artistTitle: String?
    let imageID: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case artistDisplay = "artist_display"
        case placeOfOrigin = "place_of_origin"
        case description
        case shortDescription = "short_description"
        case dimensions
        case mediumDisplay = "medium_display"
        case creditLine = "credit_line"
        case copyrightNotice = "copyright_notice"
        case artistTitle = "artist_title"
        case artistIDS = "artist_ids"
        case termTitles = "term_titles"
        case styleTitle = "style_title"
        case imageID = "image_id"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.dateStart = try container.decode(Int.self, forKey: .dateStart)
        self.dateEnd = try container.decode(Int.self, forKey: .dateEnd)
        self.artistDisplay = try container.decode(String.self, forKey: .artistDisplay)
        self.placeOfOrigin = try container.decode(String.self, forKey: .placeOfOrigin)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
        self.dimensions = try container.decode(String.self, forKey: .dimensions)
        self.mediumDisplay = try container.decode(String.self, forKey: .mediumDisplay)
        self.artistTitle = try container.decodeIfPresent(String.self, forKey: .artistTitle)
        self.imageID = try container.decode(String.self, forKey: .imageID)
    }
}
