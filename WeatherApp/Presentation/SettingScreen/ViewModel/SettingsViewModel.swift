//
//  SettingViewModel.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import Foundation

protocol SettingsViewModelInput {
}

protocol SettingsViewModelOutput {
    var isFahrenheitUnit: Bool { get }
}

protocol SettingsViewModelProtocol: SettingsViewModelInput, SettingsViewModelOutput { }

final class SettingsViewModel: SettingsViewModelProtocol {
    var isFahrenheitUnit: Bool { WeatherAppSettings.isTemperatureUnitFahrenheit }
}
