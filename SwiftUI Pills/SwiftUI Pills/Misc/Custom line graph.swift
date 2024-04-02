//
//  CustomLineGraph.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import SwiftUI

fileprivate struct SimpleStock {
    let price: Double
}

private func getHistoricalStocks() -> [SimpleStock] {
    var stocks = [SimpleStock]()
    for _ in 1...20 {
        let stock = SimpleStock(price: Double.random(in: 100...300))
        stocks.append(stock)
    }
    return stocks
}

private func getGraphLabels() -> [String] {
    (2015...2021).map { String($0) }
}

struct LineChart: View {
    let values: [Int]
    let labels: [String]
    
    let screenWidth = UIScreen.main.bounds.width
    
    private var path: Path {
        if values.isEmpty {
            return Path()
        }
        
        var offsetX: Int = Int(screenWidth/CGFloat(values.count))
        var path: Path = Path()
        path.move(to: CGPoint(x: offsetX, y: values.first ?? 0))
        
        for value in values {
            offsetX += Int(screenWidth/CGFloat(values.count))
            path.addLine(to: CGPoint(x: offsetX, y: value))
        }
        
        return path
    }
    
    var body: some View {
        VStack {
            path.stroke(.black, lineWidth: 2)
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180),axis: (x: 0.0, y: 1.0, z: 0.0))
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            HStack {
                ForEach(labels, id: \.self) { label in
                    Text(label)
                        .frame(width: screenWidth/CGFloat(labels.count) - 10)
                }
            }
        }
    }
}

struct CustomLineGraph: View {
    
    var body: some View {
        LineChart(values: getHistoricalStocks().map({ Int($0.price)}), labels: getGraphLabels())
    }
}

#Preview {
    CustomLineGraph()
}
