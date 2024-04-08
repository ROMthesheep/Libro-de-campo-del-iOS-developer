//
//  TimelineView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI

struct DemoTimelineView: View {
    
    func getDate(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .long
        
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            TimelineView(PeriodicTimelineSchedule(from: Date(), by: 1)) { context in
                Text(getDate(for: context.date))
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    DemoTimelineView()
    
}
