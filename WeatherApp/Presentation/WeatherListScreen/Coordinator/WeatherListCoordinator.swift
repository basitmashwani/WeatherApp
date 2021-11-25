//
//  WeatherListCoordinator.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
import UIKit
final class WeatherListCoordinator: BaseCoordinator {
    // MARK: - Properties
    private var parent: UINavigationController?
    // MARK: - Initializer
    ///  - Parameter UINavigationController
    init(parent: UINavigationController) {
        self.parent = parent
    }
    // MARK: - Coordinator
    /// Initiates the WeatherListViewController and Display it
    override func start() {
        let viewModel = WeatherListViewModel(useCase: WeatherUseCase())
        let controller = WeatherListViewController(viewModel: viewModel)
        parent?.pushViewController(controller, animated: true)
        viewModel.itemSelected = { weather in
            self.showWeatherDetailScreen(weather: weather)
        }
        viewModel.settingsClicked = {
            self.showSettingsScreen()
        }
    }
    private func showWeatherDetailScreen(weather: Weather) {
        let coordinator = WeatherDetailCoordinator(parent: parent!, weather: weather)
        coordinator.start()
    }
    private func showSettingsScreen() {
        let coordinator = SettingsCoordinator(parent: parent!)
        coordinator.start()
    }
}
