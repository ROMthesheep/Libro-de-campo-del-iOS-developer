//
//  ArtworkListingModel.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation

// MARK: - ArtworkListing
struct ArtworkListingResponse: Decodable {
    let pagination: Pagination
    let data: [ArtWorkModel]
}

// MARK: - Pagination
struct Pagination: Decodable {
    let total, limit, offset, totalPages: Int
    let currentPage: Int
    let nextURL: String

    enum CodingKeys: String, CodingKey {
        case total, limit, offset
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextURL = "next_url"
    }
}
