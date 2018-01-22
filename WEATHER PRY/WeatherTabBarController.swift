//
//  WeatherTabBarControllerViewController.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/22/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit

class WeatherTabBarController: UITabBarController {
    
    private(set) var currentCity: String = "" {
        didSet{
            title = currentCity
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewViewController = TableViewViewController()
        tableViewViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let collectionViewViewController = CollectionViewViewController()
        collectionViewViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let stackViewViewController = StackViewViewController()
        stackViewViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 2)
        
        let tabBarList = [tableViewViewController, collectionViewViewController, stackViewViewController]
        
        viewControllers = tabBarList
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
        
        currentCity = "Uryupinsk"
    }
}
