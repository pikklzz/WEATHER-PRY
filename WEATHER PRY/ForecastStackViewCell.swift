//
//  ForecastStackViewCell.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/30/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit
import SDWebImage

class ForecastStackViewCell: UIView, Forecastable {
    let date = UILabel()
    let minMaxTemperature = UILabel()
    let pressure = UILabel()
    let windSpeed = UILabel()
    
    internal let currentWeatherView = UIView()
    internal let weatherData = UIView()
    let currentTemperature = UILabel()
    let currentWeatherIcon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(weatherData)
        addSubview(currentWeatherView)
        configureCellContent()
        translatesAutoresizingMaskIntoConstraints = false
        
        layoutCellContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
