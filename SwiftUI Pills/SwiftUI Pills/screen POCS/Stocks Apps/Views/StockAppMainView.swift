//
//  MainView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import SwiftUI

struct StockAppMainView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        stockListVM.load()
    }
    
    private var today: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        
        let filteredStocks = stockListVM.searchTerm.isEmpty ? stockListVM.stocks : stockListVM.stocks.filter({ $0.symbol.starts(with: stockListVM.searchTerm)})
        
        return NavigationStack {
            VStack(alignment: .leading) {
                Text(today)
                    .font(.custom("Arial", size: 30))
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                SearchView(searchTerm: $stockListVM.searchTerm)
                StockListView(stocks: filteredStocks).padding([.top], -15)
                NewsArticleView(newsArticles: 
                                    stockListVM.articles)
                    .padding()
                
                Spacer()
            }
                .navigationTitle("Stocks")
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    StockAppMainView()
}
