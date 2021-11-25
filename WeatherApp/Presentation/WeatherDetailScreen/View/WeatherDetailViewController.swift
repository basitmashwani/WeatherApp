//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 25/11/2021.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var lblSunrise: UILabel!
    @IBOutlet weak var lvlSunset: UILabel!
    @IBOutlet weak var lblMornTemp: UILabel!
    @IBOutlet weak var lblEvenTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!

    let viewModel: WeatherDetailViewModel
    init(viewModel: WeatherDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        self.title = ""

    }
    private func bind(to viewModel: WeatherDetailViewModel) {
        lblSunrise.text = viewModel.sunriseTime
        lvlSunset.text = viewModel.sunsetTime
        lblMornTemp.text = viewModel.morningTemp
        lblEvenTemp.text = viewModel.eveningTemp
        lblHumidity.text = viewModel.humidity
        lblWindSpeed.text = viewModel.windSpeed

    }
}
