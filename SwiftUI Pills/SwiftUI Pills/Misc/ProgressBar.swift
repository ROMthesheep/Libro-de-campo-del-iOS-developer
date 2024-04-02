//
//  ProgressBar.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 27/3/24.
//

import SwiftUI

struct ProgressBar: View {
    
    @State private var progress: CGFloat = 0
    
    private func startDownload() {
        let timer = Timer(timeInterval: 0.1, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                print("Timer stopped")
            }
        }
        RunLoop.main.add(timer, forMode: .common)
    }
    
    var body: some View {
        VStack {
            VStack {
                ProgressView("Loading", value: progress, total: 100)
                Button("Download") {
                    startDownload()
                }
            }
        }
    }
}

#Preview {
    ProgressBar()
}
