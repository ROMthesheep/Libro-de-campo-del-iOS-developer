//
//  ArtworkListViewController.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation
import UIKit

final class ArtworkListViewController: UIViewController {
    var listView: ArtWorkListView { self.view as! ArtWorkListView }
    let apiClient = Client()
    private var tableViewDataSource: ArtworkListTableViewDataSource?
    private var tableViewDataDelegate: ArtworkListTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDataDelegate?.tappedCell = { [weak self] selectedRow in
            print("cell pressed")
            guard let cellDataSource = self?.tableViewDataSource else { return }
            let artwork = cellDataSource.artworks[selectedRow]
            let destination = ArtworkDetailViewcontroller(for: ArtworkDetailModel(for: artwork))
            self?.present(destination, animated: true)
        }
        
        Task {
            do {
                let artworks = try await apiClient.getArtworks()
                tableViewDataSource?.set(artworks: artworks.data)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    override func loadView() {
        view = ArtWorkListView()
        tableViewDataSource = ArtworkListTableViewDataSource(table: listView.tableView)
        tableViewDataDelegate = ArtworkListTableViewDelegate()
        listView.tableView.dataSource = tableViewDataSource
        listView.tableView.delegate = tableViewDataDelegate
    }
}
