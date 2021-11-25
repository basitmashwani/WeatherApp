//
//  WeatherDetailViewModel.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import Foundation

protocol WeatherDetailViewModelInput {
}

protocol WeatherDetailViewModelOutput {
    var sunriseTime: String { get }
    var sunsetTime: String { get }
    var morningTemp: String { get }
    var eveningTemp: String { get }
    var windSpeed: String { get }
    var humidity: String { get }

}

protocol WeatherDetailViewModelProtocol: WeatherDetailViewModelInput, WeatherDetailViewModelOutput { }

final class WeatherDetailViewModel: WeatherDetailViewModelProtocol {
    private let weather: Weather

    init(weather: Weather) {
        self.weather = weather
    }
    var sunsetTime: String { weather.sunsetTime }
    var sunriseTime: String { weather.sunriseTime }
    var morningTemp: String { weather.morningTemp }
    var eveningTemp: String { weather.eveningTemp }
    var windSpeed: String { weather.windSpeed }
    var humidity: String { weather.humidity }

}
