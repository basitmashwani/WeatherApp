//
//  WeatherSettings.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
import CoreLocation

enum WeatherSetting {
    static let lastLocation = "LAST_LOCATION"
}

class WeatherSettings {
    static var lastSaveLocation: CLLocation? {
        get {
            if let saveLocationData = UserDefaults.standard.data(forKey: WeatherSetting.lastLocation),
               let location = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(saveLocationData) as? CLLocation {
                return location
            } else {
                return nil
            }
        }
        set {
            if let value = newValue, let encodedLocation = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false) {
                UserDefaults.standard.set(encodedLocation, forKey: WeatherSetting.lastLocation)
            }

        }
    }
}
