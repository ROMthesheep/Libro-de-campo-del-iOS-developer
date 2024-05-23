//
//  ArtworkListViewController.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import RIBs
import RxSwift
import UIKit

protocol ArtworkListPresentableListener: AnyObject {
    func rowSelected(artwork: ArtWorkModel)
}

final class ArtworkListViewController: UIViewController, ArtworkListPresentable, ArtworkListViewControllable {
    
    weak var listener: ArtworkListPresentableListener?
    private var artworks = [ArtWorkModel]()
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ArtWorkListCellView.self, forCellReuseIdentifier: "ArtWorkListCellView")
        return table
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
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
    
    func updateTable(artworks: [ArtWorkModel]) {
        self.artworks = artworks
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ArtworkListViewController: UITableViewDataSource {
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

extension ArtworkListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listener?.rowSelected(artwork: artworks[indexPath.row])
    }
}

