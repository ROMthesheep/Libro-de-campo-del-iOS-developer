//
//  ArtWorkListCellView.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation
import UIKit
import Kingfisher

final class ArtWorkListCellView: UITableViewCell {
    let artworkImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let artworkTitleLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artworkArtistLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artworkDateLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func setupView() {
        [artworkImageView,
         artworkDateLabelView,
         artworkTitleLabelView,
         artworkArtistLabelView
        ].forEach { view in
            addSubview(view)
        }
        NSLayoutConstraint.activate([
            artworkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            artworkImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            artworkImageView.heightAnchor.constraint(equalToConstant: 100),
            artworkImageView.widthAnchor.constraint(equalToConstant: 100),
            
            artworkTitleLabelView.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 16),
            artworkTitleLabelView.topAnchor.constraint(equalTo: artworkImageView.topAnchor, constant: 0),
            
            artworkArtistLabelView.leadingAnchor.constraint(equalTo: artworkTitleLabelView.leadingAnchor, constant: 0),
            artworkArtistLabelView.topAnchor.constraint(equalTo: artworkTitleLabelView.bottomAnchor, constant: 8),
            
            artworkDateLabelView.leadingAnchor.constraint(equalTo: artworkTitleLabelView.leadingAnchor, constant: 0),
            artworkDateLabelView.topAnchor.constraint(equalTo: artworkArtistLabelView.bottomAnchor, constant: 8)
        ])
    }
    
    func configure(for model: ArtWorkModel) {
        artworkImageView.kf.setImage(with: URL(string: model.imageURL))
        artworkTitleLabelView.text = model.title
        artworkDateLabelView.text = "\(model.dateStart)-\(model.dateEnd)"
        artworkArtistLabelView.text = model.artistTitle
    }
}
