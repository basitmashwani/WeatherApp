//
//  WeatherDetailCoordinator.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import Foundation
import UIKit
final class WeatherDetailCoordinator: BaseCoordinator {
    // MARK: - Properties
    private weak var parent: UINavigationController?
    private var weather: Weather
    // MARK: - Initializer
    ///  - Parameter UINavigationController
    init(parent: UINavigationController, weather: Weather) {
        self.parent = parent
        self.weather = weather
    }
    // MARK: - Coordinator
    /// Initiates the WeatherDetailController and Display it
    override func start() {
        let controller = WeatherDetailViewController(viewModel: WeatherDetailViewModel(weather: weather))
        parent?.pushViewController(controller, animated: true)
    }
}
