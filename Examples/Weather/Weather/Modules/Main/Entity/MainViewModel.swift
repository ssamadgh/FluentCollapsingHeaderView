//
//  MainViewModel.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/15/21.
//

import Foundation

public struct KeyValueModel {
    let key: String
    let value: String
}

public enum MainViewModel {
    
    case dualKeyValue(KeyValueModel, KeyValueModel)
    case description(String)
}

public extension Weather {
    
    var viewModel: [MainViewModel] {
        [
            .description("Today: \(forecastDay.condition.title). It's \(current.temp)˚; the high will be \(forecastDay.maxTemp)˚"),
            .dualKeyValue(KeyValueModel(key: "SUNRISE", value: forecastDay.sunrise), KeyValueModel(key: "SUNSET", value: forecastDay.sunset)),
            .dualKeyValue(KeyValueModel(key: "CHANCE OF RAIN", value: "\(forecastDay.chanceOfRain)%"), KeyValueModel(key: "HUMIDITY", value: "\(current.humidity)%")),
            .dualKeyValue(KeyValueModel(key: "WIND", value: "\(current.wind.dir) \(current.wind.speed) kph"), KeyValueModel(key: "FEELS LIKE", value: "\(current.feelslike)˚")),
            .dualKeyValue(KeyValueModel(key: "PRECIPITATION", value: "\(current.precipitation) in"), KeyValueModel(key: "PRESSURE", value: "\(current.pressure) inHg")),
            .dualKeyValue(KeyValueModel(key: "VISIBILITY", value: "\(current.visibility) km"), KeyValueModel(key: "UV INDEX", value: "\(forecastDay.uv)")),
            .description("Weather for \(location.name)"),
        ]
    }
}
