//
//  ArtworkListTableViewDataSource.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation
import UIKit

final class ArtworkListTableViewDataSource: NSObject, UITableViewDataSource {
    private let table: UITableView
    private(set) var artworks = [ArtWorkModel]() {
        didSet {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    init(table: UITableView, artworks: [ArtWorkModel] = []) {
        self.table = table
        self.artworks = artworks
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        artworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtWorkListCellView", for: indexPath) as? ArtWorkListCellView else { return UITableViewCell() }
        let artwork = artworks[indexPath.row]
        cell.configure(for: artwork)
        return cell
    }
    
    func set(artworks: [ArtWorkModel]) {
        self.artworks = artworks
    }
}
