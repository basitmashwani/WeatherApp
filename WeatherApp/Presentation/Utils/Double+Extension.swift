//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import Foundation
enum Unit {
   case fahrenheit
   case celsius
}

extension Double {
    func temperatureUnit(for unit: Unit) -> Double {
        switch unit {
        case .fahrenheit:
            let celsiousValue = floor(self - 273.15)
            return (celsiousValue * 9/5) + 32
        case .celsius:
            return floor(self - 273.15)
        }
    }
}
