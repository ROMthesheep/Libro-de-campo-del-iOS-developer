//
//  ArticleViewModel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import Foundation

struct ArticleViewModel {
    let article: Article
    
    var title: String {
        article.title
    }
    var publication: String {
        article.publication.uppercased()
    }
    var imageUrl: URL? {
        URL(string: article.imageURL) ?? nil
    }
}
