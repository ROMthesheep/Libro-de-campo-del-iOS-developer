//
//  ArtworkDetailViewController.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import RIBs
import RxSwift
import UIKit

protocol ArtworkDetailPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ArtworkDetailViewController: UIViewController, ArtworkDetailPresentable, ArtworkDetailViewControllable {

    weak var listener: ArtworkDetailPresentableListener?
    var selectedArtwork: ArtWorkModel?
    
    init(selectedArtwork: ArtWorkModel?) {
        self.selectedArtwork = selectedArtwork
        super.init(nibName: nil, bundle: nil)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update(model: selectedArtwork)
        setupView()
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
    
    func update(model: ArtWorkModel?) {
        guard let model else { return }
        artworkImageView.kf.setImage(with: URL(string: model.imageURL))
        artworkTitleLabelView.text = model.title
        artworkArtistNameLabelView.text = model.artistTitle
        artworkDateLabelView.text = "\(model.dateStart)-\(model.dateEnd)"
        artworkDescriptionLabelView.text = model.description
        artworkDimensionsLabelView.text = model.dimensions
    }
}
