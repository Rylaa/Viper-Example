//
//  HomePresenter.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import Foundation

final class HomePresenter: HomeViewToPresenterConformable {
    
    weak var view: HomePresenterToViewConformable?
    var router: HomePresenterToRouterConformable
    var interactor: HomePresenterToInteractorConformable
    var storiesAndMeditation: [MeditationAndStoryContainerResultable] { interactor.storiesAndMeditation }
    
    init(interactor: HomePresenterToInteractorConformable, router: HomePresenterToRouterConformable) {
        self.interactor = interactor
        self.router = router
    }

    func initialize() {
        view?.startLoadingIndicator()
        interactor.initialize()
    }
    
    func showDetail(_ item: MeditationAndStoryResultable) {
        router.showDetail(item)
    }
}

extension HomePresenter: HomeInteractorToPresenterConformable {
    func fetchingCompleted() {
        view?.stopLoadingIndicator()
        view?.fetchingCompleted()
    }

    func fetchingFailed(error: Error?) {
        view?.stopLoadingIndicator()
        view?.fetchingFailed(error: error)
    }
}
