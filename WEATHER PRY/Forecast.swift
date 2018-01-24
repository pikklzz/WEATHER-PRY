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
    let date: Double
    let currentTemperature: Int
    let maxTemperature: Int
    let minTemperature: Int
    let pressure: Double
    let windSpeed: Double
    let weatherIconID: String
    
    init(json: JSON) {
        date = json["dt"].doubleValue
        currentTemperature = Int(json["main"]["temp"].doubleValue.rounded())
        maxTemperature = Int(json["main"]["temp_max"].doubleValue.rounded())
        minTemperature = Int(json["main"]["temp_min"].doubleValue.rounded())
        pressure = json["main"]["pressure"].doubleValue
        windSpeed = json["wind"]["speed"].doubleValue
        weatherIconID = json["weather"][0]["icon"].stringValue
    }
}
