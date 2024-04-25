//
//  ArtworkDetailBuilder.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import RIBs

protocol ArtworkDetailDependency: Dependency {
}

final class ArtworkDetailComponent: Component<ArtworkDetailDependency> {
}

// MARK: - Builder

protocol ArtworkDetailBuildable: Buildable {
    func build(withListener listener: ArtworkDetailListener, data: ArtWorkModel) -> ArtworkDetailRouting
}

final class ArtworkDetailBuilder: Builder<ArtworkDetailDependency>, ArtworkDetailBuildable {

    override init(dependency: ArtworkDetailDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ArtworkDetailListener, data: ArtWorkModel) -> ArtworkDetailRouting {
        let component = ArtworkDetailComponent(dependency: dependency)
        let viewController = ArtworkDetailViewController(selectedArtwork: data)
        let interactor = ArtworkDetailInteractor(presenter: viewController)
        interactor.listener = listener
        return ArtworkDetailRouter(interactor: interactor, viewController: viewController)
    }
}
