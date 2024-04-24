//
//  ViewController.swift
//  MVP
//
//  Created by RomTheSheep on 24/4/24.
//

import UIKit

protocol ListViewProtocol: AnyObject {
    func mostrarDatos()
}

class ArtworkListView: UIViewController, ListViewProtocol {
    private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ArtWorkListCellView.self, forCellReuseIdentifier: "ArtWorkListCellView")
        return table
    }()
    
    lazy var presenter: ListPresenterProtocol = {
        let presenter = ArtworkListPresenter()
        presenter.view = self
        return presenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewLoaded()
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
    
    func mostrarDatos() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ArtworkListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getArtworksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtWorkListCellView", for: indexPath) as? ArtWorkListCellView else { return UITableViewCell() }
        let artwork = presenter.getArtwork(for: indexPath.row)
        cell.configure(for: artwork)
        return cell
    }
}

extension ArtworkListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigate(selectedArtwork: presenter.getArtwork(for: indexPath.row))
    }
}

extension ArtworkListView {
    func navigate(selectedArtwork: ArtWorkModel) {
        let detailView = ArtworkDetailView(artwork: selectedArtwork)
        self.present(detailView, animated: true)
    }
}

