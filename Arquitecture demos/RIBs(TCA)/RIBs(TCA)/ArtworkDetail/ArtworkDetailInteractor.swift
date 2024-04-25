//
//  ArtworkDetailInteractor.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import RIBs
import RxSwift

protocol ArtworkDetailRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ArtworkDetailPresentable: Presentable {
    var listener: ArtworkDetailPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ArtworkDetailListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ArtworkDetailInteractor: PresentableInteractor<ArtworkDetailPresentable>, ArtworkDetailInteractable, ArtworkDetailPresentableListener {

    weak var router: ArtworkDetailRouting?
    weak var listener: ArtworkDetailListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ArtworkDetailPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
