//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var unitSwitch: UISwitch!
    let viewModel: SettingsViewModel
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(viewModel: viewModel)
    }
    private func bind(viewModel: SettingsViewModel) {
        unitSwitch.isOn = viewModel.isFahrenheitUnit
    }
    @IBAction func switchValueChanged() {
        WeatherAppSettings.isTemperatureUnitFahrenheit = unitSwitch.isOn
    }
}
