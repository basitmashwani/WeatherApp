//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigation = UINavigationController()
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        appCoordinator = AppCoordinator(parent: navigation)
        appCoordinator?.start()
    }

}
