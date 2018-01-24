//
//  NetworkManager.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/22/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkManager {
    func retreiveWeatherData(completionHandler: @escaping (Any?, Error?) -> ()){
        let apiCall = "https://api.openweathermap.org/data/2.5/forecast?q=Minsk,by&units=metric&APPID=e22ed9e9ff5d20822590895ae1d740f4"
        
        Alamofire.request(apiCall).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    completionHandler(value as Any, nil)
                }
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func iconURL(byID ID: String) -> String {
        let apiCall = "https://openweathermap.org/img/w/\(ID).png"
        return apiCall
    }
}
