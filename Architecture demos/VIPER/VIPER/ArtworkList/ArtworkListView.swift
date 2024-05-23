//
//  ArtworkListView.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation
import UIKit

class ArtworkListView: UIViewController {
    private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ArtWorkListCellView.self, forCellReuseIdentifier: "ArtWorkListCellView")
        return table
    }()
    
    private let presenter: ArtworkListPresenter
    
    init(presenter: ArtworkListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupTableView()
        presenter.onViewAppear()
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

extension ArtworkListView: ArtworkListViewDelegate {
    func update(artworks: [ViewModel]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ArtworkListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewmodels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtWorkListCellView", for: indexPath) as? ArtWorkListCellView else { return UITableViewCell() }
        let artwork = presenter.viewmodels[indexPath.row]
        cell.configure(for: artwork)
        return cell
    }
}

extension ArtworkListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellPressed(at: indexPath.row)
    }
}
