//
//  ArtworkDetailView.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation
import UIKit

final class ArtworkDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func setupView() {
        backgroundColor = .white
        [artworkImageView,
         artworkTitleLabelView,
         artworkArtistNameLabelView,
         artworkDateLabelView,
         artworkDateDisplayLabelView,
         artworkDescriptionLabelView,
         artworkDimensionsLabelView
        ].forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            artworkImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 8),
            artworkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
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
            artworkDescriptionLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            artworkDescriptionLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            
            artworkDimensionsLabelView.topAnchor.constraint(equalTo: artworkDescriptionLabelView.bottomAnchor, constant: 8),
            artworkDimensionsLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
    
    func configure(for model: ArtworkDetailModel) {
        artworkImageView.kf.setImage(with: URL(string: model.imageURL))
        artworkTitleLabelView.text = model.title
        artworkArtistNameLabelView.text = model.artistName
        artworkDateLabelView.text = "Crafted from \(model.dateStart) to \(model.dateEnd)"
        artworkDateDisplayLabelView.text = "Piece displayed in \(model.dateDisplay)"
        artworkDescriptionLabelView.text = model.description
        artworkDimensionsLabelView.text = model.dimensions
    }
}
