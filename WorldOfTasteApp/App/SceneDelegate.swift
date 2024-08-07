//
//  SceneDelegate.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 22.07.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        /* для онбординга
        window.rootViewController = UINavigationController(rootViewController: FirstLaunchPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal))
        window.makeKeyAndVisible()
         */
        
        let menuController = MenuTabBarController()
        window.rootViewController = menuController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

