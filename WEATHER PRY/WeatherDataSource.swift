//
//  WeatherDataSource.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/23/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WeatherDataSource {
    private let networkManager = NetworkManager()
    
    mutating func weather(completionHandler: @escaping (String?, [Forecast]?, Error?) -> ()) {
        
        var forecasts: [Forecast] = []
        var currentCity: String = ""
        
        networkManager.retreiveWeatherData() { response, error in
            if let rawResponse = response {
                let json = JSON(rawResponse)
                currentCity = json["city"]["name"].stringValue
                for (_, forecastData) in json["list"] {
                    forecasts.append(Forecast(json: forecastData))
                }
            }
            
            completionHandler(currentCity, forecasts, nil)
        }
    }
}
