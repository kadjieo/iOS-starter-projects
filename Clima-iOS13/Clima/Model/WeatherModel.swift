//
//  WeatherModel.swift
//  Clima
//
//  Created by Dara Khadjehnouri on 2022-04-27.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int // stored properties
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
    
    var conditionName: String { // computed property
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
            
        }
    }
}
