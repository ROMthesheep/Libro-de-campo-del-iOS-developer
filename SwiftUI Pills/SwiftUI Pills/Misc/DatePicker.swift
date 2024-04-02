//
//  DatePicker.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 27/3/24.
//

import SwiftUI

struct DatePickerView: View {
    
    @State private var selectedDate1 = Date()
    @State private var selectedDate2 = Date()
    @State private var selectedDate3 = Date()
    @State private var selectedDate4 = Date()
    @State private var selectedDate5 = Date()
    @State private var selectedDate6 = Date()
    @State private var selectedDate7 = Date()
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponets = DateComponents(year: 2012, month: 4, day: 30)
        let endComponents = DateComponents(year: 2032, month: 4, day: 30)
        return calendar.date(from: startComponets)!...calendar.date(from: endComponents)!
    }()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("----Displayed modes--")
                    .font(.largeTitle)
                DatePicker("Select date 1", selection: $selectedDate1)
                DatePicker("Select date 2", selection: $selectedDate2, displayedComponents: [.date, .hourAndMinute])
                DatePicker("Select date 3", selection: $selectedDate3, displayedComponents: [.date])
                DatePicker("Select date 4", selection: $selectedDate4, in: dateRange, displayedComponents: [.date])
                Text("--Styles--")
                    .font(.largeTitle)
                DatePicker("Select date 6", selection: $selectedDate5)
                    .datePickerStyle(.compact)
                DatePicker("Select date 5", selection: $selectedDate5)
                    .datePickerStyle(.graphical).padding()
                DatePicker("Select date 7", selection: $selectedDate5)
                    .datePickerStyle(.wheel)
            } .padding()
        }
    }
}

#Preview {
    DatePickerView()
}
