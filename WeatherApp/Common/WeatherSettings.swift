//
//  WeatherSettings.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
import CoreLocation

enum WeatherAppSetting {
    static let isFahrenheit = "IS_FAHRENHEIT"
}
class WeatherAppSettings {
    static var isTemperatureUnitFahrenheit: Bool {
        get {
           return UserDefaults.standard.bool(forKey: WeatherAppSetting.isFahrenheit)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: WeatherAppSetting.isFahrenheit)
            }

        }
}
