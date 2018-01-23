//
//  WeatherTableViewCell.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/23/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let cellID = "WeatherTableViewCell"
    
    var date = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        func configureCellContent() {
            
            date.translatesAutoresizingMaskIntoConstraints = false
            date.font = UIFont.systemFont(ofSize: 30)
            
            contentView.addSubview(date)
        }
        
        func layoutCellContent() {
            var allConstraints: [NSLayoutConstraint] = []
            
            allConstraints.append(date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor))
            allConstraints.append(date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor))
            allConstraints.append(date.topAnchor.constraint(equalTo: contentView.topAnchor))
            allConstraints.append(date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor))
            
            NSLayoutConstraint.activate(allConstraints)
        }
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCellContent()
        layoutCellContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
