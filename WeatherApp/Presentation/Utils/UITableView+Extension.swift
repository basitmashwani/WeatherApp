//
//  UITableView+Extension.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import UIKit.UITableView
extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView & NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Couldn't cast cell in \(T.reuseIdentifier)")
        }
        return cell
    }
}
