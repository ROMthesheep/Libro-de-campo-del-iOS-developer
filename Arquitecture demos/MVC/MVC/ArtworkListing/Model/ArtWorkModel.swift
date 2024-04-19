//
//  ArtWorkModel.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation

struct ArtWorkModel: Decodable {
    let id: Int
    let apiLink: String
    let title: String
    let dateStart, dateEnd: Int
    let dateDisplay: String
    let artistDisplay, placeOfOrigin: String
    let description, shortDescription: String?
    let dimensions: String
    let dimensionsDetail: [DimensionsDetail]
    let mediumDisplay: String
    let creditLine: String
    let copyrightNotice: String?
    let artistTitle: String?
    let artistIDS: [Int]
    let termTitles: [String]
    let styleTitle: String?
    let imageID: String
    
    var imageURL: String {
        "https://www.artic.edu/iiif/2/\(imageID)/full/843,/0/default.jpg"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case apiLink = "api_link"
        case title
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case dateDisplay = "date_display"
        case artistDisplay = "artist_display"
        case placeOfOrigin = "place_of_origin"
        case description
        case shortDescription = "short_description"
        case dimensions
        case dimensionsDetail = "dimensions_detail"
        case mediumDisplay = "medium_display"
        case creditLine = "credit_line"
        case copyrightNotice = "copyright_notice"
        case artistTitle = "artist_title"
        case artistIDS = "artist_ids"
        case termTitles = "term_titles"
        case styleTitle = "style_title"
        case imageID = "image_id"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.apiLink = try container.decode(String.self, forKey: .apiLink)
        self.title = try container.decode(String.self, forKey: .title)
        self.dateStart = try container.decode(Int.self, forKey: .dateStart)
        self.dateEnd = try container.decode(Int.self, forKey: .dateEnd)
        self.dateDisplay = try container.decode(String.self, forKey: .dateDisplay)
        self.artistDisplay = try container.decode(String.self, forKey: .artistDisplay)
        self.placeOfOrigin = try container.decode(String.self, forKey: .placeOfOrigin)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
        self.dimensions = try container.decode(String.self, forKey: .dimensions)
        self.dimensionsDetail = try container.decode([DimensionsDetail].self, forKey: .dimensionsDetail)
        self.mediumDisplay = try container.decode(String.self, forKey: .mediumDisplay)
        self.creditLine = try container.decode(String.self, forKey: .creditLine)
        self.copyrightNotice = try container.decodeIfPresent(String.self, forKey: .copyrightNotice)
        self.artistTitle = try container.decodeIfPresent(String.self, forKey: .artistTitle)
        self.artistIDS = try container.decode([Int].self, forKey: .artistIDS)
        self.termTitles = try container.decode([String].self, forKey: .termTitles)
        self.styleTitle = try container.decodeIfPresent(String.self, forKey: .styleTitle)
        self.imageID = try container.decode(String.self, forKey: .imageID)
    }
}

struct DimensionsDetail: Decodable {
    let depth: Int?
    let width, height: Int
    let clarification: String?
}
