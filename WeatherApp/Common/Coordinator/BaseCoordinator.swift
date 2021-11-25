//
//  BaseCoordinator.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import UIKit

class BaseCoordinator: Coordinator {
    // MARK: - Coordinator
    /// start the navigation
    func start() {
        assertionFailure("Child Coordinator must override this!")
    }
}
