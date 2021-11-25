//
//  Weather.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
struct Weather {
    let currentDate: String
    let minimumTemp: String
    let maximumTemp: String
    let morningTemp: String
    let eveningTemp: String
    let humidity: String
    let windSpeed: String
    let weatherCondition: String
    let sunriseTime: String
    let sunsetTime: String
    init(weather value: WeatherRealm) {
        currentDate = Date.getDateStringFromTimeSeconds(seconds: value.date)
        if WeatherAppSettings.isTemperatureUnitFahrenheit {
            minimumTemp = "\((value.temperature?.min ?? 0.0).temperatureUnit(for: .fahrenheit))°F"
            maximumTemp = "\((value.temperature?.max ?? 0.0).temperatureUnit(for: .fahrenheit))°F"
            morningTemp = "\((value.temperature?.morning ?? 0.0).temperatureUnit(for: .fahrenheit))°F"
            eveningTemp = "\((value.temperature?.evening ?? 0.0).temperatureUnit(for: .fahrenheit))°F"
        } else {
            minimumTemp = "\((value.temperature?.min ?? 0.0).temperatureUnit(for: .celsius))°C"
            maximumTemp = "\((value.temperature?.max ?? 0.0).temperatureUnit(for: .celsius))°C"
            morningTemp = "\((value.temperature?.morning ?? 0.0).temperatureUnit(for: .celsius))°C"
            eveningTemp = "\((value.temperature?.evening ?? 0.0).temperatureUnit(for: .celsius))°C"
        }
        humidity = "\(value.humidity)%"
        windSpeed = "\(value.windSpeed) mph"
        weatherCondition = value.conditions.first?.condition ?? ""
        sunriseTime = Date.getTime(second: value.sunrise)
        sunsetTime = Date.getTime(second: value.sunset)
    }
}
