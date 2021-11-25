//
//  SettingCoordinator.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import Foundation
import UIKit
final class SettingsCoordinator: BaseCoordinator {
    // MARK: - Properties
    private var parent: UINavigationController?
    // MARK: - Initializer
    ///  - Parameter UINavigationController
    init(parent: UINavigationController) {
        self.parent = parent
    }
    // MARK: - Coordinator
    /// Initiates the SettingController  and Display it
    override func start() {
        let viewModel = SettingsViewModel()
        let controller = SettingsViewController(viewModel: viewModel)
        parent?.pushViewController(controller, animated: true)
    }
}
