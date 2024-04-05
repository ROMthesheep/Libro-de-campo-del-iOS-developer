//
//  ImageLoader.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 1/4/24.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
