//
//  Coordinator.swift
//  MVC-C
//
//  Created by Luca Lago on 19/4/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var viewcontroller: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    
    func start()
}

extension Coordinator {
    var viewcontroller: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}
