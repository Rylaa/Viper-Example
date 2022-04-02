//
//  HomeViewController.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import UIKit

struct HomeViewConstants {
    static let str = "Look. Pretty, isn't it? \n Perfectly balanced. As all things shold be."
    static let ok = "Tamam"
    static let error = "Hata"
}

final class HomeViewController: BaseVC {
    
    @IBOutlet private weak var tableView: UITableView!
    private var indicator: UIActivityIndicatorView!
    private var dataSource: HomeViewControllerDataSource!
    var presenter: HomeViewToPresenterConformable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

fileprivate extension HomeViewController {
    func setupUI() {
        dataSource = HomeViewControllerDataSource(with: presenter)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        
        indicator = UIActivityIndicatorView()
        indicator.center = view.center
        view.addSubview(indicator)
        
    }
    
    func showMessage(_ message: String) {
        let alertController = UIAlertController(title: HomeViewConstants.error, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: HomeViewConstants.ok, style: .cancel, handler: nil)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}

extension HomeViewController: HomePresenterToViewConformable {
 
    func fetchingCompleted() {
        tableView.reloadData()
    }
    
    func startLoadingIndicator() {
        indicator.startAnimating()
    }
    
    func stopLoadingIndicator() {
        indicator.stopAnimating()
    }
    
    func fetchingFailed(error: Error?) {
        if let errorStr = error?.localizedDescription {
            showMessage(errorStr)
        }
    }

}

extension HomeViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
}

extension HomeViewController: StoryboardInstantiable {
    static var storyboardName: String { return "Home" }
    static var storyboardIdentifier: String? { return "HomeViewController" }
}
