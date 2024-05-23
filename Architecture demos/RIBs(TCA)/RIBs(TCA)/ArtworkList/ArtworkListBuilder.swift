//
//  ArtworkListBuilder.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import RIBs

protocol ArtworkListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ArtworkListComponent: Component<ArtworkListDependency> {
    
    override init(dependency: ArtworkListDependency) {
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol ArtworkListBuildable: Buildable {
    func build() -> LaunchRouting
}

final class ArtworkListBuilder: Builder<ArtworkListDependency>, ArtworkListBuildable {

    override init(dependency: ArtworkListDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = ArtworkListComponent(dependency: dependency)
        let viewController = ArtworkListViewController()
        let interactor = ArtworkListInteractor(presenter: viewController)
        let artworkDetailBuilder = ArtworkDetailBuilder(dependency: component)
        return ArtworkListRouter(interactor: interactor,
                                 viewController: viewController,
                                 artworkDetailBuilder: artworkDetailBuilder)
    }
}
