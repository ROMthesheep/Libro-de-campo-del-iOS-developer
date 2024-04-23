//
//  ArtworkDetailViewcontroller.swift
//  MVC
//
//  Created by RomTheSheep on 18/4/24.
//

import Foundation
import UIKit

final class ArtworkDetailViewcontroller: UIViewController {
    var mainView: ArtworkDetailView { self.view as! ArtworkDetailView }
    
    init(for artwork: ArtworkDetailModel) {
        super.init(nibName: nil, bundle: nil)
        mainView.configure(for: artwork)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ArtworkDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
