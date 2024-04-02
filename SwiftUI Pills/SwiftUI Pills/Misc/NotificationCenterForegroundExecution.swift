//
//  NotificationCenterForegroundExecution.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 1/4/24.
//

import SwiftUI

struct NotificationCenterForegroundExecution: View {
    @State private var stockName: String = "ENE"
    @State private var stockPrice: Double?
    
    private func updateStockPrice() {
        stockPrice = Double.random(in: 0...1.0)
    }
    
    var body: some View {
        VStack {
            Text(self.stockName)
                .font(.largeTitle)
            .padding()
            Text("$\(stockPrice ?? 0.0)")
        }.onAppear {
            updateStockPrice()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
            updateStockPrice()
        })
    }
}

#Preview {
    NotificationCenterForegroundExecution()
}
