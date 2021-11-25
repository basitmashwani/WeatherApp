//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import Foundation
import CoreLocation

enum WeatherListViewState: Equatable {
    case loaded
    case failed(String?)
}
protocol WeatherListViewModelInput {
    func loadData(location: CLLocation)
    func viewWillAppeared()
    func didSelectRow(at index: Int)
    func row(at index: Int) -> WeatherCellItemViewModel
    func didSelectSettings()

}

protocol WeatherListViewModelOutput {
    var numberOfRows: Int { get }
    var title: String { get }
}

protocol WeatherListViewModelProtocol: WeatherListViewModelInput, WeatherListViewModelOutput { }

final class WeatherListViewModel: WeatherListViewModelProtocol {
    // MARK: - Properties
    private let useCase: WeatherUseCaseProtocol
    private var cellItems: [WeatherCellItemViewModel] = []
     var weatherItems: [Weather] = []
    var itemSelected: (Weather) -> Void = {_ in }
    var settingsClicked: () -> Void = { }
    var viewStateUpdated: ((WeatherListViewState) -> Void)?

    init(useCase: WeatherUseCaseProtocol) {
        self.useCase = useCase
    }
    var numberOfRows: Int { weatherItems.count }
    var title: String { "Weather Update" }

    private func onSuccess(data: [Weather]) {
        cellItems = data.map { WeatherCellItemViewModel(item: $0) }
        weatherItems = data
        viewStateUpdated?(.loaded)
    }
    private func onFailure(errorMessage: String) {
        viewStateUpdated?(.failed(errorMessage))
    }

    private func populateData() {
        onSuccess(data: useCase.getWeather())
    }
    func loadData(location: CLLocation) {
        useCase.fetchWeather(latitude: location.coordinate.latitude, longititude: location.coordinate.longitude) {[weak self] result in
            switch result {
            case .success(_ ):
                self?.populateData()
            case .failure(let error):
                self?.onFailure(errorMessage: error.localizedDescription)
            }
        }
    }
    func row(at index: Int) -> WeatherCellItemViewModel {
        WeatherCellItemViewModel(item: weatherItems[index])
    }

    func viewWillAppeared() {
        self.populateData()
    }
    func didSelectRow(at index: Int) {
        itemSelected(weatherItems[index])
    }

    func didSelectSettings() {
        settingsClicked()
    }
}
