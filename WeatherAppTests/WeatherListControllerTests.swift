//
//  WeatherListControllerTests.swift
//  WeatherAppTests
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import XCTest
@testable import WeatherApp
class WeatherListControllerTests: XCTestCase {
    var weatherCityVC: WeatherListViewController!
    override func setUp() {
        super.setUp()
         let viewController = WeatherListViewController(viewModel: WeatherListViewModel(useCase: WeatherUseCase()))
        weatherCityVC = viewController
        _ = weatherCityVC.view
    }
    override func tearDown() {
        weatherCityVC = nil
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(weatherCityVC.tblView)
    }

    func test_ConformsToTableViewDataSourceProtocol() {
         XCTAssert(weatherCityVC.conforms(to: UITableViewDataSource.self))
         XCTAssert(weatherCityVC.responds(to: #selector(weatherCityVC.tableView(_:numberOfRowsInSection:))))
         XCTAssert(weatherCityVC.responds(to: #selector(weatherCityVC.tableView(_:cellForRowAt:))))
     }
    func test_TableViewUsesCustomCell_TableViewCustomCell() {

        if weatherCityVC.viewModel.weatherItems.count > 0 {
            let cell = weatherCityVC.tableView(weatherCityVC.tblView, cellForRowAt: IndexPath(row: 0, section: 0))
            XCTAssert(cell is WeatherTableViewCell)
        }

    }
}
