//
//  String+Extension.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import Foundation
import UIKit

extension UIImage {
   static func getSystemImage(for weather: String) -> UIImage? {
        switch weather {
        case "Clouds":
            return UIImage(systemName: "cloud.fill")
        case "Rain":
            return UIImage(systemName: "cloud.heavyrain.fill")
        case "Snow":
            return UIImage(systemName: "cloud.snow")
        case "Clear":
            return UIImage(systemName: "sun.min")
        default:
            return nil
        }
    }
}
