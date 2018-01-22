//
//  Forecast.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/22/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import Foundation

struct Forecast {
    let cityName: String
    let date: Date
    let currentTemperature: Double
    let maxTemperature: Double
    let minTemperature: Double
    let pressure: Double
    let windSpeed: Double
    let weatherIconURL: String
}
