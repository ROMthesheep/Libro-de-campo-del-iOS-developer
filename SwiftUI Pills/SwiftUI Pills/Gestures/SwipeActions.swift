//
//  SwipeActions.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI

struct SwipeActions: View {
    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
                Text("\(index)")
                    .swipeActions(edge: .leading) {
                        Button {
                            
                        } label: {
                            if index % 2 == 0 {
                                Label("Read", systemImage: "envelope.open")
                            } else {
                                Label("Unread", systemImage: "envelope.badge")
                            }
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            // cosa
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        Button {
                            // cosa
                        } label: {
                            Label("Flag", systemImage: "flag")
                        }
                    }
            }
        }
    }
}

#Preview {
    SwipeActions()
}
