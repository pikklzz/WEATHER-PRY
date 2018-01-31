//
//  CollectionViewViewController.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/22/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit

class CollectionViewViewController: UIViewController {
    private let collectionViewLayout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionViewLayout)
        collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: ForecastCollectionViewCell.cellID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var tabBar: WeatherTabBarController? = nil
    
    private func configureCollectionView() {
        
        collectionViewLayout.estimatedItemSize = CGSize(width: view.frame.width, height: 150)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsSelection = false
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
    }
    
    @objc private func loadForecasts() {
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        configureCollectionView()
        
        tabBar = tabBarController as? WeatherTabBarController
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadForecasts), name: NSNotification.Name(rawValue: "loadCollection"), object: nil)
        
        super.viewDidLoad()
    }
}

extension CollectionViewViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let tabBar = tabBar {
            return tabBar.forecasts.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.cellID, for: indexPath)
            as? ForecastCollectionViewCell else {
                fatalError()
        }
        
        if let tabBar = tabBar {
            let forecast = tabBar.forecasts[indexPath.row]
            
            func formatDate() -> String {
                let date = Date(timeIntervalSince1970: forecast.date)
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .full
                dateFormatter.timeStyle = .short
                
                return dateFormatter.string(from: date)
            }
            
            let date = formatDate()
            
            cell.date.text = date
            cell.minMaxTemperature.text = "\(forecast.minTemperature)℃ / \(forecast.maxTemperature)℃"
            cell.pressure.text = "Pressure: \(forecast.pressure) hPa"
            cell.windSpeed.text = "Wind Speed: \(forecast.windSpeed) m/s"
            
            cell.currentWeatherIcon.sd_setShowActivityIndicatorView(true)
            cell.currentWeatherIcon.sd_setImage(with: URL(string: tabBar.weatherDataSource.icon(byID: forecast.weatherIconID)))
            
            cell.currentTemperature.text = "\(forecast.currentTemperature)℃"
        }
        return cell
    }
}
