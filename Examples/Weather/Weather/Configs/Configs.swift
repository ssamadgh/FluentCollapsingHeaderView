//
//  Configs.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/15/21.
//

import Foundation

fileprivate let weatherApiKey = "9725c13b70b0498bb4d230107211209"

public struct WeatherURL {
    
    private static let baseURL = "https://api.weatherapi.com/v1/"

    public static func forecast(forQuery query: String) -> URL {
        var urlComponents = URLComponents(string: baseURL + "forecast.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: weatherApiKey),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "aqi", value: "no")
        ]
        return urlComponents.url!
    }
    
}
