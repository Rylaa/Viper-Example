//
//  HomeInteractor.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import Foundation

final class HomeInteractor: HomePresenterToInteractorConformable {

    weak var presenter: HomeInteractorToPresenterConformable?
    var worker: HomeWorkerConformable = Api.shared
    var storiesAndMeditation: [MeditationAndStoryContainerResultable] = []
    
    init() {}

    func initialize() {
       loadResultOfMeditationsAndStories()
    }
        
    func loadResultOfMeditationsAndStories() {
        worker.getStories { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                if let stories = response.stories,
                   let meditations = response.meditations {
                    self.storiesAndMeditation.append(MeditationAndStoryContainer(of: .meditation, data: meditations))
                    if response.banner {
                        self.storiesAndMeditation.append(MeditationAndStoryContainer(of: .banner, data: []))
                    }
                    self.storiesAndMeditation.append(MeditationAndStoryContainer(of: .story, data: stories))
                
                }
                self.presenter?.fetchingCompleted()
            case .failure(let error):
                self.presenter?.fetchingFailed(error: error)
            }
        }
    }
}
