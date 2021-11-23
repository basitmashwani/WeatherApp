//
//  CitySelectionCoordinator.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import Foundation
import UIKit

final class CitySelectionCoordinator: BaseCoordinator {
    // MARK: - Properties
    private weak var parent: UINavigationController?
    // MARK: - Initializer
    ///  - Parameter UINavigationController
    init(parent: UINavigationController) {
        self.parent = parent
    }
    // MARK: - Coordinator
    /// Initiates the CitySelectionViewController and Display it
    override func start() {
        let controller = CitySelectionViewController(viewModel: CitySelectionViewModel())
        parent?.pushViewController(controller, animated: true)
    }
}
