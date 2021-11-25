//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import Foundation
import UIKit
final class AppCoordinator: BaseCoordinator {
    // MARK: - Properties
    let navigationController: UINavigationController

    // MARK: - Initializer
    /// - Parameter UINavigationController
    /// - Parameter AppServiceLocation
    init(parent: UINavigationController) {
        self.navigationController = parent
    }
    // MARK: - Coordinator
    /// Start RecipeListCoordinator
    override func start() {
        openWeatherListScreen()
    }
    private func openWeatherListScreen() {
        let coordinator = WeatherListCoordinator(parent: navigationController)
        coordinator.start()
    }
}
