//
//  Webservice.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 25/3/24.
//

import Foundation

class Webservice {
    
    func getNews(completion: @escaping (([Article]?) -> Void)) {
        makeRequest(stringURL: "https://island-bramble.glitch.me/top-news", type: [Article]?.self) { stoks in
            completion(stoks)
        } errorHandler: { error in
            print("I did and oopsy")
        }
    }
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        makeRequest(stringURL: "https://island-bramble.glitch.me/stocks", type: [Stock]?.self) { stoks in
            completion(stoks)
        } errorHandler: { error in
            print("I did and oopsy")
        }
    }
    
    private func makeRequest<T: Decodable>(stringURL: String, type: T.Type, completionHandler: @escaping (T) -> Void, errorHandler: @escaping (String) -> Void) {
        
        guard let url = URL(string: stringURL) else {
            errorHandler("URL not valid")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data, error == nil else {
                        print(error as Any)
                        errorHandler(error?.localizedDescription ?? "Error!")
                        return
                    }
                    
                    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                        print("status code is not 200")
                        errorHandler("Status code is not 200")
                        print(response as Any)
                    }
                    
                    if let mappedResponse = try? JSONDecoder().decode(T.self, from: data) {
                        completionHandler(mappedResponse)
                    }
                }
                
                task.resume()
        }
}
