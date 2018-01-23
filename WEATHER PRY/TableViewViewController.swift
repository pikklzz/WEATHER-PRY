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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func configureTableView() {
        tableView.backgroundView = UIView()
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
    
    override func viewDidLoad() {
        configureTableView()
        layoutTableView()
        
        super.viewDidLoad()
    }
}

