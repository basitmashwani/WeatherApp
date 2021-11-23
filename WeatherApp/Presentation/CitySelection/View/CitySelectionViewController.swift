//
//  CitySelectionViewController.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import UIKit
import CoreLocation

class CitySelectionViewController: UIViewController {

    let viewModel: CitySelectionViewModel
    let locationManager = CLLocationManager()
    init(viewModel: CitySelectionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    private func setupLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }

    private func bind(to viewModel: CitySelectionViewModel) {
    }

    @IBAction func locationPressed() {
        setupLocationManager()
    }
}

extension CitySelectionViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        WeatherSettings.lastSaveLocation = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
    }
}
