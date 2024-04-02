//
//  Eventform.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 20/3/24.
//

import SwiftUI

struct Eventform: View {
    @State private var schedule = false
    @State private var isUrgent = false
    @State private var vibemeter = 0.5
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Fill up the event information")
                    .padding(5)
                    .lineLimit(nil)) {
                        
                    Toggle(isOn: $schedule, label: {
                        Text("Scheduled")
                    })
                    HStack {
                        VStack(alignment: .leading) {
                            Text("From")
                            Text("To")
                        }
                        Spacer()
                        NavigationLink(destination: Text("Event scheduled")) {
                            VStack(alignment: .trailing) {
                                Text("Sunset")
                                Text("Sunrise")
                            }
                        }.fixedSize()
                    }.foregroundStyle(.blue)
                }
                
                Section {
                    Toggle(isOn: $isUrgent, label: {
                        Text("Mark as prioritary")
                    })
                }
                
                Section(header: Text("How much are u looking forward going to this event?").padding(5).lineLimit(nil)) {
                    ZStack {
                        HStack {
                            Text("Naahh")
                            Spacer()
                            Text("Hell yeah")
                        }
                        .offset(y: -15)
                        Slider(value: $vibemeter)
                            .padding([.top], 20)

                    }
                }
               
            }
        }
    }
}

#Preview {
    Eventform()
}
