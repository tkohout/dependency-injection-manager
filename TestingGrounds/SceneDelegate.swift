//
//  SceneDelegate.swift
//  TestingGrounds
//
//  Created by Miguel Batista on 24/05/2023.
//

import DI
import FeatureApi
import UIKit
import HomeApi

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let repository: FeatureRepository = DIManager.resolve(FeatureRepository.self)
        let viewController = ViewController(repository: repository)

        let homeFactory = DIManager.resolve(HomeViewControllerFactory.self)
        let homeVC = homeFactory.make(usage: .movies)

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
