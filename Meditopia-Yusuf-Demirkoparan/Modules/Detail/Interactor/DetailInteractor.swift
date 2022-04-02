//
//  DetailInteractor.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import Foundation

final class DetailInteractor: DetailPresenterToInteractorConformable {
   
    weak var presenter: DetailInteractorToPresenterConformable?
    var storiesAndMeditation: [MeditationAndStoryContainerResultable] = []
    var worker: DetailWorkerConformable  = Api.shared
    var detailItem: MeditationAndStoryResultable
    
    init(detailItem: MeditationAndStoryResultable) {
        self.detailItem = detailItem
    }

    func initialize() {
        presenter?.fetchingCompleted()
    }
}

