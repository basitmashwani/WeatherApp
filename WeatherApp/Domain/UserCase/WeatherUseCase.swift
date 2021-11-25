//
//  WeatherUseCase.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation

typealias WeatherFetchResponse = (Result<Bool, Error>) -> Void

protocol WeatherUseCaseProtocol {
    func fetchWeather(latitude: Double, longititude: Double, onCompletion: @escaping WeatherFetchResponse)
    func getWeather() -> [Weather]
}

final class WeatherUseCase: WeatherUseCaseProtocol {
    // MARK: - Private Property
    private let weatherRepository: WeatherRepository
    private let weatherPersistance: WeatherPersistance

    // MARK: - Initializer
    /// Initialize the recipeRepository
    /// - Parameter RecipeRepositoryProtocol
    init(weatherRepository: WeatherRepository = WeatherRepository(), weatherPersistance: WeatherPersistance = WeatherPersistance()) {
        self.weatherRepository = weatherRepository
        self.weatherPersistance = weatherPersistance
    }
    /// fetch  weather data  from weather  repo and returns the result
    /// - Parameter onCompletion: closure to return weather array in case of success and error in the case of failure
    func  fetchWeather(latitude: Double, longititude: Double, onCompletion: @escaping WeatherFetchResponse) {
        weatherRepository.fetchWeatherList(latitude: latitude, longititude: longititude) {[weatherPersistance] result in
            switch result {
            case .success(let response):
                weatherPersistance.saveWeather(weather: response)
                onCompletion(.success(!response.dailyForecasts.isEmpty))
            case .failure:
                onCompletion(.failure(Constants.Errors.apiError))
            }
        }
    }
    /// get  weather data  from persistance
    /// - Parameter onCompletion: closure to return weather array in case of success 
    func getWeather() -> [Weather] {
        weatherPersistance.getWeather()
    }

}
