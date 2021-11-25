//
//  UIView+Extension.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import UIKit

protocol ReusableView: AnyObject {  static var reuseIdentifier: String { get} }
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: AnyObject { static var nibName: String { get} }
extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
