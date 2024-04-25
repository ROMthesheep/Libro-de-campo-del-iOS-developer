//
//  AppComponent.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import Foundation
import RIBs

class AppComponent: Component<EmptyDependency>, ArtworkListDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
