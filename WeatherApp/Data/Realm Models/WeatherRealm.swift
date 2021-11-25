//
//  WeatherRealm.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
import RealmSwift

@objcMembers class WeatherMainRealm: Object {
    dynamic var weatherID: String = ""
    dynamic var weatherForecasts = List<WeatherRealm>()
    convenience init(weatherMainDTO: WeatherMainDTO) {
        self.init()
        weatherID = UUID().uuidString
        for forecast in weatherMainDTO.dailyForecasts {
            weatherForecasts.append(WeatherRealm(weatherDTO: forecast))
        }
    }
    override static func primaryKey() -> String? {
        return "weatherID"
    }
}

@objcMembers class WeatherRealm: Object {
    dynamic var temperature: TemperatureRealm?
    dynamic var humidity: Int = 0
    dynamic var windSpeed: Double = 0.0
    dynamic var conditions = List<WeatherConditionRealm>()
    dynamic var sunrise: Int = 0
    dynamic var sunset: Int = 0
    dynamic var date: Int = 0

    convenience init(weatherDTO: WeatherDTO) {
        self.init()
        temperature = TemperatureRealm(temperatureDTO: weatherDTO.temperature)
        humidity = weatherDTO.humidity
        windSpeed = weatherDTO.windSpeed
        date = weatherDTO.date
        for condition in weatherDTO.conditions {
            conditions.append(WeatherConditionRealm(weatherConditionDTO: condition))
        }
        sunrise = weatherDTO.sunrise
        sunset = weatherDTO.sunset
    }
}

@objcMembers class TemperatureRealm: Object {
    dynamic var min: Double = 0.0
    dynamic var max: Double = 0.0
    dynamic var morning: Double = 0.0
    dynamic var evening: Double = 0.0
    convenience init(temperatureDTO: TemperatureDTO) {
        self.init()
        min = temperatureDTO.min
        max = temperatureDTO.max
        morning = temperatureDTO.morn
        evening = temperatureDTO.eve
    }
}

@objcMembers class WeatherConditionRealm: Object {
    dynamic var condition: String = ""
    dynamic var weatherDescription: String = ""
    convenience init(weatherConditionDTO: WeatherConditionDTO) {
        self.init()
        condition = weatherConditionDTO.condition
        weatherDescription = weatherConditionDTO.description
    }

}

extension WeatherRealm {
    func toDomain() -> Weather {
        .init(weather: self)
    }
}
