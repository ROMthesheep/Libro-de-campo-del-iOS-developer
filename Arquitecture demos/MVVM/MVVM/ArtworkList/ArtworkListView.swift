//
//  ViewController.swift
//  MVVM
//
//  Created by RomTheSheep on 23/4/24.
//

import UIKit
import Combine

class ArtworkListView: UIViewController {
    private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ArtWorkListCellView.self, forCellReuseIdentifier: "ArtWorkListCellView")
        return table
    }()
    
    private let viewModel = ArtworkListViewModel(client: Client())
    private var artworks = [ArtWorkModel]()
    private var cancelable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindings()
        setupTableView()
        viewModel.fetchArtworks()
    }
    
    func setBindings() {
        viewModel.$artworks
            .receive(on: DispatchQueue.main)
            .sink { models in
                self.artworks = models
                self.tableView.reloadData()
            }
            .store(in: &cancelable)
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ArtworkListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        artworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtWorkListCellView", for: indexPath) as? ArtWorkListCellView else { return UITableViewCell() }
        let artwork = artworks[indexPath.row]
        cell.configure(for: artwork)
        return cell
    }
}

extension ArtworkListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigate(selectedArtwork: artworks[indexPath.row])
    }
}

extension ArtworkListView {
    func navigate(selectedArtwork: ArtWorkModel) {
        let detailView = ArtworkDetailView(artwork: selectedArtwork)
        self.present(detailView, animated: true)
    }
}
