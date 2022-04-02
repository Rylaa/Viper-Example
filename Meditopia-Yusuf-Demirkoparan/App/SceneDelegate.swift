//
//  SceneDelegate.swift
//  Yusuf-Demirkoparan
//
//  Created by Yusuf Demirkoparan on 2.04.2022.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            let navigationController = UINavigationController()
            let homeViewController = HomeRouter.createModule(using: navigationController)
            navigationController.pushViewController(homeViewController, animated: false)
            window!.rootViewController = navigationController
            window!.makeKeyAndVisible()
            
            theme.appTheme.setCustomBackButton()
        }
    }
}
