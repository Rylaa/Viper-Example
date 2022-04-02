//
//  HomeDataSource.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import UIKit

final class HomeViewControllerDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: HomeViewToPresenterConformable
    
    init(with presenter: HomeViewToPresenterConformable) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.storiesAndMeditation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getTableViewCellWithCellType(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = presenter.storiesAndMeditation[indexPath.row]
        switch model.type {
        case .story:
            let padLineCount = Int((UIScreen.main.bounds.width - 46) / 169)
            var height: CGFloat = 0
            let bounds = UIScreen.main.bounds
            let model = presenter.storiesAndMeditation[indexPath.row].data
            let userInterface = UIDevice.current.userInterfaceIdiom
            let count = (model.count % 2 == 0 ? model.count : model.count + 1) / (userInterface == .phone ? (bounds.height > bounds.width ? 2 : 4) : padLineCount)
            for _ in 0...count {
                height = height + (userInterface == .phone ? CalculatedConsants.phoneHeight : 258) - 10
            }
            return height
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    private func getTableViewCellWithCellType(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let model = presenter.storiesAndMeditation[indexPath.row]
        switch model.type {
        case .meditation:
            return makeMeditationCell(tableView, cellForRowAt: indexPath)
        case .banner:
            return makeBannerCell(tableView, cellForRowAt: indexPath)
        case .story:
            return makeStoryCell(tableView, cellForRowAt: indexPath)
        }
    }
    
    private func makeMeditationCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeditationTableViewCell.identifier, for: indexPath) as? MeditationTableViewCell else {
            return UITableViewCell()
        }
        let model = presenter.storiesAndMeditation[indexPath.row].data
        cell.config(model)
        cell.selectedItem = { [unowned self] item in
            presenter.showDetail(item)
        }
        return cell
    }
    
    private func makeStoryCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.identifier, for: indexPath) as? StoriesTableViewCell else {
            return UITableViewCell()
        }
        let model = presenter.storiesAndMeditation[indexPath.row].data
        cell.config(model)
        cell.selectedItem = { [unowned self] item in
            presenter.showDetail(item)
        }
        return cell
    }
    
    private func makeBannerCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else {
            return UITableViewCell()
        }
        let bannerText = HomeViewConstants.str
        cell.config(text: bannerText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
