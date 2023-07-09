//
//  WeatherModel.swift
//  Weather App
//
//  Created by Amelia Citra on 26/05/23.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "01clearsky"
        case 300...321:
            return "02.fewclouds"
        case 500...531:
            return "03scatteredclouds"
        case 600...622:
            return "04brokenclouds"
        case 701...781:
            return "09showerrain"
        case 800:
            return "10rain"
        case 801...804:
            return "11thunderstomr"
        default:
            return "cloud"
        }
    }
    
}
