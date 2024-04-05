//
//  StockListViewModel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var articles: [ArticleViewModel] = [ArticleViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchStocks() {
        StocksWebservice().getStocks { stocks in
            guard let stocks else { return }
            DispatchQueue.main.async {
                self.stocks = stocks.map(StockViewModel.init)
            }
        }
    }
    
    private func fetchNews() {
        StocksWebservice().getNews { articles in
            guard let articles else { return }
            DispatchQueue.main.async {
                self.articles = articles.map(ArticleViewModel.init)
            }
        }
    }
    
    
}
