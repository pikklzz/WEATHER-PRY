//
//  Forecastable.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/25/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit

protocol Forecastable {
    var date: UILabel { get }
    var minMaxTemperature: UILabel { get }
    var pressure: UILabel { get }
    var windSpeed: UILabel { get }
    
    var currentWeatherView: UIView { get }
    var weatherData: UIView { get }
    var currentTemperature: UILabel { get }
    var currentWeatherIcon: UIImageView { get }
    
    func configureCellContent()
    func layoutCellContent()
}

extension Forecastable {
    func configureCellContent() {
        date.font = UIFont.preferredFont(forTextStyle: .headline)
        date.lineBreakMode = .byWordWrapping
        date.numberOfLines = 2
        
        let weatherDataFont = UIFont.preferredFont(forTextStyle: .caption1)
        
        minMaxTemperature.font = weatherDataFont
        currentTemperature.font = weatherDataFont
        pressure.font = weatherDataFont
        windSpeed.font = weatherDataFont
        
        weatherData.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        minMaxTemperature.translatesAutoresizingMaskIntoConstraints = false
        pressure.translatesAutoresizingMaskIntoConstraints = false
        windSpeed.translatesAutoresizingMaskIntoConstraints = false
        
        currentWeatherView.translatesAutoresizingMaskIntoConstraints = false
        currentTemperature.translatesAutoresizingMaskIntoConstraints = false
        currentWeatherIcon.translatesAutoresizingMaskIntoConstraints = false
        
        weatherData.addSubview(date)
        weatherData.addSubview(minMaxTemperature)
        weatherData.addSubview(pressure)
        weatherData.addSubview(windSpeed)
        
        currentWeatherView.addSubview(currentTemperature)
        currentWeatherView.addSubview(currentWeatherIcon)
    }
    
    func layoutCellContent() {
        let views: [String: Any] = [
            "currentWeatherView": currentWeatherView,
            "currentTemperature": currentTemperature,
            "currentWeatherIcon": currentWeatherIcon,
            "weatherData": weatherData,
            "date": date,
            "minMaxTemperature": minMaxTemperature,
            "pressure": pressure,
            "windSpeed": windSpeed
        ]
        var allConstraints: [NSLayoutConstraint] = []
        
        let currentWeatherVerticalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[currentWeatherView]",
            metrics: nil,
            views: views)
        allConstraints += currentWeatherVerticalConstraint
        
        let weatherDataVerticalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[weatherData]-|",
            metrics: nil,
            views: views)
        allConstraints += weatherDataVerticalConstraint
        
        let currentWeatherViewHorizontalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[currentWeatherView(50)]-[weatherData]-|",
            metrics: nil,
            views: views)
        allConstraints += currentWeatherViewHorizontalConstraint
        
        let currentWeatherViewContentVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[currentTemperature]-(-20)-[currentWeatherIcon]-|",
            metrics: nil,
            views: views)
        allConstraints += currentWeatherViewContentVerticalConstraints
        
        let weatherDataVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[date]-[minMaxTemperature]-[pressure]-[windSpeed]-|",
            metrics: nil,
            views: views)
        allConstraints += weatherDataVerticalConstraints
        
        allConstraints.append(currentTemperature.leadingAnchor.constraint(equalTo: currentWeatherView.leadingAnchor))
        allConstraints.append(currentTemperature.trailingAnchor.constraint(equalTo: currentWeatherView.trailingAnchor))
        
        allConstraints.append(currentWeatherIcon.leadingAnchor.constraint(equalTo: currentWeatherView.leadingAnchor))
        allConstraints.append(currentWeatherIcon.trailingAnchor.constraint(equalTo: currentWeatherView.trailingAnchor))
        
        allConstraints.append(date.leadingAnchor.constraint(equalTo: weatherData.leadingAnchor))
        allConstraints.append(date.trailingAnchor.constraint(equalTo: weatherData.trailingAnchor))
        
        allConstraints.append(minMaxTemperature.leadingAnchor.constraint(equalTo: weatherData.leadingAnchor))
        allConstraints.append(minMaxTemperature.trailingAnchor.constraint(equalTo: weatherData.trailingAnchor))
        
        allConstraints.append(pressure.leadingAnchor.constraint(equalTo: weatherData.leadingAnchor))
        allConstraints.append(pressure.trailingAnchor.constraint(equalTo: weatherData.trailingAnchor))
        
        allConstraints.append(windSpeed.leadingAnchor.constraint(equalTo: weatherData.leadingAnchor))
        allConstraints.append(windSpeed.trailingAnchor.constraint(equalTo: weatherData.trailingAnchor))
        
        NSLayoutConstraint.activate(allConstraints)
    }
}
