//
//  HomeView.swift
//  MVVM & combine practice
//
//  Created by Luca Lago on 6/6/23.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold, width: .standard)
        label.text = "Bienvenido a la pagina principal"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
        ])
    }
}
