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
    var artworkDetailCoordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDataDelegate?.tappedCell = { [weak self] selectedRow in
            print("cell pressed")
            guard let cellDataSource = self?.tableViewDataSource else { return }
            let artwork = cellDataSource.artworks[selectedRow]
            
            self?.artworkDetailCoordinator = Bool.random() ? 
                ArtworkDetailPushCoordinator(navigationController: self?.navigationController, artwork: ArtworkDetailModel(for: artwork)) :
                ArtworkDetailModalCoordinator(viewcontroller: self, artwork: ArtworkDetailModel(for: artwork))
            
            self?.artworkDetailCoordinator?.start()
        }
        
        Task {
            do {
                let artworks = try await apiClient.getArtworks(page: 3)
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
