//
//  ArtworkDetailView.swift
//  VIPER
//
//  Created by RomTheSheep on 22/4/24.
//

import Foundation
import UIKit

class ArtworkDetailView: UIViewController {
    private let presenter: ArtworkDetailPresentable
    
    init(presenter: ArtworkDetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    let artworkImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let artworkTitleLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let artworkArtistNameLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artworkDateLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artworkDateDisplayLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artworkDescriptionLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let artworkDimensionsLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.onViewAppear()
    }
    
    func setupView() {
        view.backgroundColor = .white
        [artworkImageView,
         artworkTitleLabelView,
         artworkArtistNameLabelView,
         artworkDateLabelView,
         artworkDateDisplayLabelView,
         artworkDescriptionLabelView,
         artworkDimensionsLabelView
        ].forEach { childView in
            view.addSubview(childView)
        }
        
        NSLayoutConstraint.activate([
            artworkImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8),
            artworkImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            artworkImageView.widthAnchor.constraint(equalToConstant: 170),
            artworkImageView.heightAnchor.constraint(equalToConstant: 170),
            
            artworkTitleLabelView.topAnchor.constraint(equalTo: artworkImageView.topAnchor, constant: 0),
            artworkTitleLabelView.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 8),
            
            artworkArtistNameLabelView.topAnchor.constraint(equalTo: artworkTitleLabelView.bottomAnchor, constant: 8),
            artworkArtistNameLabelView.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 8),
            
            artworkDateLabelView.topAnchor.constraint(equalTo: artworkArtistNameLabelView.bottomAnchor, constant: 8),
            artworkDateLabelView.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 8),
            
            artworkDateDisplayLabelView.topAnchor.constraint(equalTo: artworkDateLabelView.bottomAnchor, constant: 8),
            artworkDateDisplayLabelView.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 8),
            
            artworkDescriptionLabelView.topAnchor.constraint(equalTo: artworkImageView.bottomAnchor, constant: 8),
            artworkDescriptionLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            artworkDescriptionLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            
            artworkDimensionsLabelView.topAnchor.constraint(equalTo: artworkDescriptionLabelView.bottomAnchor, constant: 8),
            artworkDimensionsLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        ])
    }
    
    
}

extension ArtworkDetailView: ArtworkDetailViewDelegate {
    func update(viewmodel: ArtworkDetailViewModel) {
        artworkImageView.kf.setImage(with: URL(string: viewmodel.imageURL))
        artworkTitleLabelView.text = viewmodel.title
        artworkArtistNameLabelView.text = viewmodel.artistTitle
        artworkDateLabelView.text = viewmodel.date
        artworkDescriptionLabelView.text = viewmodel.description
        artworkDimensionsLabelView.text = viewmodel.dimensions
    }
}
