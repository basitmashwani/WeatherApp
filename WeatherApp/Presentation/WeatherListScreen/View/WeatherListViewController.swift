//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import UIKit
import CoreLocation

class WeatherListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    let viewModel: WeatherListViewModel
    var isLocationFeteched: Bool = false
    let locationManager = CLLocationManager()
    init(viewModel: WeatherListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        setupTableView()
        addNavigationButton()
        bind(to: viewModel)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppeared()
    }
    private func setupTableView() {
        tblView.register(WeatherTableViewCell.self)
    }
    private func addNavigationButton() {
        let settingBtn = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(settingPressed))
        self.navigationItem.rightBarButtonItem = settingBtn
    }
    @objc func settingPressed() {
        viewModel.didSelectSettings()
    }
    private func bind(to viewModel: WeatherListViewModel) {
        viewModel.viewStateUpdated = { [weak self] state in
            switch state {
            case .loaded:
                self?.tblView.reloadData()
            case .failed(let error):
                self?.showAlert(with: "Error", and: error)
            }
        }
    }
    private func setupLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
}

// MARK: - TableView DataSource
extension WeatherListViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as WeatherTableViewCell
        cell.configure(with: viewModel.row(at: indexPath.row))
        return cell
    }
}

// MARK: - TableView Delegate
extension WeatherListViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath.row)
         tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
// MARK: - Location Delegate
extension WeatherListViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        if !isLocationFeteched {
            viewModel.loadData(location: CLLocation(latitude: locValue.latitude, longitude: locValue.longitude))
            isLocationFeteched = true
        }
    }
}
