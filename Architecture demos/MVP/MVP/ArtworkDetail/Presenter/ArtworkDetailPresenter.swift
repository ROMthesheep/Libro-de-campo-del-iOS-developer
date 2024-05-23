//
//  ArtworkDetailPresenter.swift
//  MVP
//
//  Created by RomTheSheep on 24/4/24.
//

import Foundation

protocol DetailPresenterProtocol { }

class ArtworkDetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    
}
