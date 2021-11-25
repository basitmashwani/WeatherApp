//
//  WeatherDTO.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation

struct WeatherMainDTO: Codable {
    let dailyForecasts: [WeatherDTO]
    enum CodingKeys: String, CodingKey {
        case dailyForecasts = "daily"
    }
}

struct WeatherDTO: Codable {
    let date: Int
    let temperature: TemperatureDTO
    let humidity: Int
    let windSpeed: Double
    let conditions: [WeatherConditionDTO]
    let sunrise: Int
    let sunset: Int
    enum CodingKeys: String, CodingKey {
        case humidity, sunrise, sunset
        case temperature = "temp"
        case conditions = "weather"
        case windSpeed = "wind_speed"
        case date = "dt"
    }
}

struct TemperatureDTO: Codable {
    let min: Double
    let max: Double
    let morn: Double
    let eve: Double
}

struct WeatherConditionDTO: Codable {
    let condition: String
    let description: String
    enum CodingKeys: String, CodingKey {
        case condition = "main"
        case description
    }
}

// MARK: - Extension
extension WeatherDTO {
    /// Method that changes the DTO to Realm Model
    /// - Returns: Weather Realm Model
    func toRealm() -> WeatherRealm {
        .init(weatherDTO: self)
    }
}
