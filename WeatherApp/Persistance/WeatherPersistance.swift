//
//  WeatherPersistance.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
import RealmSwift
protocol WeatherPersistancing {
    func saveWeather(weather: WeatherMainDTO)
    func getWeather() -> [Weather]
}

struct WeatherPersistance: WeatherPersistancing {
    func saveWeather(weather: WeatherMainDTO) {
        let realm = try! Realm()
           let weatherRealm = WeatherMainRealm(weatherMainDTO: weather)
        try? realm.write {
            realm.delete(realm.objects(WeatherMainRealm.self))
            realm.add(weatherRealm, update: .all)
        }
    }
    func getWeather() -> [Weather] {
        let realm = try! Realm()
        let weatherRealm = realm.objects(WeatherMainRealm.self)
      let items = weatherRealm
            .flatMap {$0.weatherForecasts}
            .map {Weather(weather: $0)}
    return Array(items)
}
}
