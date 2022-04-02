//
//  DetailProtocols.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import Foundation

protocol DetailViewToPresenterConformable: AnyObject {
    var view: DetailPresenterToViewConformable? { get set }
    var router: DetailPresenterToRouterConformable { get set }
    var detailItem: MeditationAndStoryResultable { get }
    func initialize()
}

protocol DetailPresenterToViewConformable: AnyObject {
   func setupView(detailItem: MeditationAndStoryResultable)
}

protocol DetailPresenterToInteractorConformable: AnyObject {
    var presenter: DetailInteractorToPresenterConformable? { get set }
    var worker: DetailWorkerConformable { get set }
    var detailItem: MeditationAndStoryResultable { get set }
    func initialize()
}

protocol DetailInteractorToPresenterConformable: AnyObject {
    func fetchingCompleted() 
}
protocol DetailPresenterToRouterConformable: AnyObject {}
protocol DetailWorkerConformable {}
