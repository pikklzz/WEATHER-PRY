//
//  ForecastTableViewCell.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/25/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit
import SDWebImage

class ForecastTableViewCell: UITableViewCell, Forecastable {
    
    static let cellID = "ForecastTableViewCell"
    
    let date = UILabel()
    let minMaxTemperature = UILabel()
    let pressure = UILabel()
    let windSpeed = UILabel()
    
    internal let currentWeatherView = UIView()
    internal let weatherData = UIView()
    let currentTemperature = UILabel()
    let currentWeatherIcon = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCellContent()
        contentView.addSubview(weatherData)
        contentView.addSubview(currentWeatherView)
        
        layoutCellContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
