//
//  StockListView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import SwiftUI

struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundStyle(.gray)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(stock.price)
                    .font(.custom("Arial", size: 22))
                Button(stock.change) {
                    
                }
                .frame(width: 50)
                .padding(5)
                .background(.red)
                .foregroundStyle(.white)
                .cornerRadius(6)
            }
        }
    }
}

struct StockListView: View {
    
    let stocks: [StockViewModel]
    var body: some View {
        List(stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }.scrollContentBackground(.hidden)
    }
}

#Preview {
    StockListView(stocks: [StockViewModel(stock: Stock(symbol: "PTS", description: "cosa de dinero", price: 16.69, change: "+0.45"))])
}
