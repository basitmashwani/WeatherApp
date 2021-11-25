//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
import Alamofire

/// TypeAlias for Response Type
typealias WeatherMainResponse = (Result<WeatherMainDTO, Error>) -> Void
typealias WeatherResponse = ([WeatherDTO]) -> Void

protocol WeatherRepositoryProtocol {
    /// it will fetch weather.
    /// - Parameter completion: block triggered when fetching is completed.
    func fetchWeatherList(latitude: Double, longititude: Double, onCompletion: @escaping WeatherMainResponse)
}

final class WeatherRepository: WeatherRepositoryProtocol {
    // MARK: - Protocol Implementation
    /// Fetch weather using datastore from api.
    /// - Parameters: closure to return weather array in case of success and error in the case of failure
    func fetchWeatherList(latitude: Double, longititude: Double, onCompletion: @escaping WeatherMainResponse) {
        AF.request(API.forecaseEndPoint(latitude, longititude).path)
                .validate()
                .responseDecodable { (response: DataResponse<WeatherMainDTO, AFError>) in
                    switch response.result {
                    case .failure(let error):
                        onCompletion(.failure(Constants.Errors.other(error)))
                    case .success(let weatherResponse) where weatherResponse.dailyForecasts.isEmpty:
                        onCompletion(.failure(Constants.Errors.apiError))
                    case .success(let weatherResponse):
                        onCompletion(.success(weatherResponse))
                    }
                }
        }
}
