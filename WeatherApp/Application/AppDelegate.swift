//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by SyedAbdulBasit on 23/11/2021.
//

import UIKit
import Realm
import RealmSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func applicationDidFinishLaunching(_ application: UIApplication) {
        Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
    }
}
