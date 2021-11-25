//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 24/11/2021.
//

import UIKit.UITableViewCell

final class WeatherTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMaxDegree: UILabel!
    @IBOutlet weak var lblMinDegree: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        isUserInteractionEnabled = true
    }
    /// Populate cell's view with data
    /// - Parameter item: contains data for the cell
    func configure(with item: WeatherCellItemViewModel) {
        lblDate.text = item.currentDate
        lblMaxDegree.text = item.maximumDegree
        lblMinDegree.text = item.minimumDegree
        lblHumidity.text = item.humidity
        imgLogo.image = item.weatherImage
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
