//
//  ViewController.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/22/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var tabBar: WeatherTabBarController? = nil
    
    private func configureTableView() {
        tableView.backgroundView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.clipsToBounds = true
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500.0
        
        view.addSubview(tableView)
    }
    
    private func layoutTableView() {
        var allTableViewConstraints: [NSLayoutConstraint] = []
        
        allTableViewConstraints.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        allTableViewConstraints.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        allTableViewConstraints.append(tableView.topAnchor.constraint(equalTo: view.topAnchor))
        allTableViewConstraints.append(tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        NSLayoutConstraint.activate(allTableViewConstraints)
    }
    
    @objc private func loadForecasts() {
        tableView.reloadData() 
    }
    
    override func viewDidLoad() {
        configureTableView()
        layoutTableView()
        
        tabBar = tabBarController as? WeatherTabBarController
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadForecasts), name: NSNotification.Name(rawValue: "load"), object: nil)
        
        super.viewDidLoad()
    }
}

extension TableViewViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tabBar = tabBar {
            return tabBar.forecasts.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.cellID, for: indexPath) as! WeatherTableViewCell
        if let tabBar = tabBar {
            let forecast = tabBar.forecasts[indexPath.row]
            cell.date.text = forecast.date
        }
        return cell
    }
}

