//
//  WeatherTabBarControllerViewController.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/22/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit
import MBProgressHUD

class WeatherTabBarController: UITabBarController {
    
    private(set) var currentCity: String = "WEATHER PRY" {
        didSet{
            title = currentCity
        }
    }
    
    private(set) var weatherDataSource = WeatherDataSource()
    private(set) var forecasts: [Forecast] = []
    
    private func setupTabs() {
        let tableViewViewController = TableViewViewController()
        tableViewViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let collectionViewViewController = CollectionViewViewController()
        collectionViewViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let stackViewViewController = StackViewViewController()
        stackViewViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 2)
        
        let tabBarList = [tableViewViewController, collectionViewViewController, stackViewViewController]
        viewControllers = tabBarList
    }
    
    @objc private func renewWeather() {
        MBProgressHUD.showAdded(to: view, animated: true)
        weatherDataSource.weather() { currentCity, forecasts, error in
            if let currentCity = currentCity {
                self.currentCity = currentCity
            }
            if let forecasts = forecasts {
                self.forecasts = forecasts
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(renewWeather))
        
        setupTabs()
        renewWeather()
        
        super.viewDidLoad()
        
    }
}
