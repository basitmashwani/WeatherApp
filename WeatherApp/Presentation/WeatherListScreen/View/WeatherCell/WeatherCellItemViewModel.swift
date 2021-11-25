//
//  WeatherCellItemViewModel.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
import UIKit
struct WeatherCellItemViewModel: Equatable {
    let currentDate: String
    let minimumDegree: String
    let maximumDegree: String
    let weatherImage: UIImage?
    let humidity: String
}

extension WeatherCellItemViewModel {
    init(item: Weather) {
        currentDate = item.currentDate
        minimumDegree = "\(item.minimumTemp)"
        maximumDegree = "\(item.maximumTemp)"
        humidity = "\(item.humidity)"
        weatherImage = UIImage.getSystemImage(for: item.weatherCondition)
    }
}
