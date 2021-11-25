//
//  Constants.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import Foundation
protocol Path {
    var path: String { get }
}
enum API {
    case forecaseEndPoint(Double, Double)
}

struct Constants {
    static let apiKey = "4109a1c8faf78e66d97c9539028dac8b"
    enum Errors: LocalizedError {
        case apiError
        case other(Error)

        var errorDescription: String? {
            switch self {
            case .apiError:
                return "Ops Something went wrong. Please try later!"
            case .other(let error):
                return error.localizedDescription
            }
        }
    }
}

extension API: Path {
    var path: String {
        switch self {
        case .forecaseEndPoint(let latitude, let longtitude): return "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longtitude)&appid=\(Constants.apiKey)"
        }
    }
}
