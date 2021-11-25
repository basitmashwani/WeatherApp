//
//  Date+Extension.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import Foundation

extension Date {
    static func getDateStringFromTimeSeconds(seconds: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(seconds))
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateStyle = .medium
      return formatter.string(from: date)
    }
    static func getTime(second: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(second))
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "hh:mm a"
      return formatter.string(from: date)
    }
}
