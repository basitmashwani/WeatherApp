//
//  UIViewController+Extension.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import UIKit
extension UIViewController {
    func showAlert(with title: String? = nil, and message: String? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
