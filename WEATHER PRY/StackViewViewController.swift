//
//  StackViewViewController.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/22/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit

class StackViewViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        let insets = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = .vertical
        stackView.distribution  = .fill
        stackView.alignment = .leading
        stackView.spacing = 0
        
        return stackView
    }()
    
    private var tabBar: WeatherTabBarController? = nil
    
    private func layoutScrollView() {
        var allTableViewConstraints: [NSLayoutConstraint] = []
        
        allTableViewConstraints.append(scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        allTableViewConstraints.append(scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        allTableViewConstraints.append(scrollView.topAnchor.constraint(equalTo: view.topAnchor))
        allTableViewConstraints.append(scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        NSLayoutConstraint.activate(allTableViewConstraints)
    }
    
    private func layoutStackView() {
        var allTableViewConstraints: [NSLayoutConstraint] = []
        
        allTableViewConstraints.append(stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor))
        allTableViewConstraints.append(stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))
        allTableViewConstraints.append(stackView.topAnchor.constraint(equalTo: scrollView.topAnchor))
        allTableViewConstraints.append(stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
        allTableViewConstraints.append(stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor))
        
        NSLayoutConstraint.activate(allTableViewConstraints)
    }

    @objc private func loadForecasts() {
        if let tabBar = tabBar {
            for forecast in tabBar.forecasts{
                func formatDate() -> String {
                    let date = Date(timeIntervalSince1970: forecast.date)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .full
                    dateFormatter.timeStyle = .short
                    
                    return dateFormatter.string(from: date)
                }
                
                let cell = ForecastStackViewCell()
                let date = formatDate()
                
                cell.date.text = date
                cell.minMaxTemperature.text = "\(forecast.minTemperature)℃ / \(forecast.maxTemperature)℃"
                cell.pressure.text = "Pressure: \(forecast.pressure) hPa"
                cell.windSpeed.text = "Wind Speed: \(forecast.windSpeed) m/s"
                
                cell.currentWeatherIcon.sd_setShowActivityIndicatorView(true)
                cell.currentWeatherIcon.sd_setImage(with: URL(string: tabBar.weatherDataSource.icon(byID: forecast.weatherIconID)))
                cell.currentTemperature.text = "\(forecast.currentTemperature)℃"
                
                stackView.addArrangedSubview(cell)
            }
        }
    }
    
    override func viewDidLoad() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        view.backgroundColor = .white
        
        layoutScrollView()
        layoutStackView()
        
        tabBar = tabBarController as? WeatherTabBarController
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadForecasts), name: NSNotification.Name(rawValue: "loadStack"), object: nil)
        
        loadForecasts()
        
        super.viewDidLoad()
    }
    
}
