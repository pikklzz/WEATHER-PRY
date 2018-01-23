//
//  Forecast.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/22/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Forecast {
    let date: String
    let currentTemperature: Double
    let maxTemperature: Double
    let minTemperature: Double
    let pressure: Double
    let windSpeed: Double
    let weatherIconID: String
    
    init(json: JSON) {
        date = json["dt_txt"].stringValue
        currentTemperature = json["main"]["temp"].doubleValue
        maxTemperature = json["main"]["temp_max"].doubleValue
        minTemperature = json["main"]["temp_min"].doubleValue
        pressure = json["main"]["pressure"].doubleValue
        windSpeed = json["wind"]["speed"].doubleValue
        weatherIconID = json["weather"][0]["icon"].stringValue
    }
}
