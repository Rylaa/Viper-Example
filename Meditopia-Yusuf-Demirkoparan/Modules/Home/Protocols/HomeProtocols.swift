//
//  HomeProtocols.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import Foundation

protocol HomeViewToPresenterConformable: AnyObject {
    var view: HomePresenterToViewConformable? { get set }
    var router: HomePresenterToRouterConformable { get set }
    var interactor: HomePresenterToInteractorConformable { get set }
    var storiesAndMeditation: [MeditationAndStoryContainerResultable] { get } // **
    func initialize()
    func showDetail(_ item: MeditationAndStoryResultable)
}

protocol HomePresenterToViewConformable: AnyObject {
    func startLoadingIndicator()
    func stopLoadingIndicator()
    func fetchingCompleted()
    func fetchingFailed(error: Error?)
}

protocol HomePresenterToInteractorConformable: AnyObject {
    var presenter: HomeInteractorToPresenterConformable? { get set }
    var worker: HomeWorkerConformable { get set }
    var storiesAndMeditation: [MeditationAndStoryContainerResultable] { get set }
    func initialize()
    func loadResultOfMeditationsAndStories()
}

protocol HomeInteractorToPresenterConformable: AnyObject {
    func fetchingCompleted()
    func fetchingFailed(error: Error?)
}

protocol HomePresenterToRouterConformable: AnyObject {
    func showDetail(_ item: MeditationAndStoryResultable)
}

protocol HomeWorkerConformable {
    typealias CompletionHandler = ((Result<MeditationResponse>) -> Void)
    func getStories(completion: @escaping CompletionHandler)
}

protocol MeditationAndStoryResultable {
    var uiTitle: String { get }
    var uiSubTitle: String { get }
    var url: URL? { get }
    var uiDate: String { get }
    var uiContent: String { get }
}

struct MeditationAndStoryContainer: MeditationAndStoryContainerResultable {
    var type: MeditationAndStoryType
    var data: [MeditationAndStoryResultable]
    
    init(of type: MeditationAndStoryType, data: [MeditationAndStoryResultable]) {
        self.type = type
        self.data = data
    }
}

protocol MeditationAndStoryContainerResultable {
    var type: MeditationAndStoryType { get }
    var data: [MeditationAndStoryResultable] { get }
}
