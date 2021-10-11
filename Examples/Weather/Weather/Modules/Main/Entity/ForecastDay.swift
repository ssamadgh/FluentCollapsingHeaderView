//
//  DayWeather.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/14/21.
//

import Foundation

public struct ForecastDay: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case day
        case astro
    }

    enum DayCodingKeys: String, CodingKey {
        case maxTemp = "maxtemp_c"
        case minTemp = "mintemp_c"
        case chanceOfRain = "daily_chance_of_rain"
        case uv
        case condition
    }

    enum AstroCodingKeys: String, CodingKey {
        case sunrise
        case sunset
    }

    public let maxTemp: Int
    public let minTemp: Int
    public let chanceOfRain: Double
    public let sunrise: String
    public let sunset: String
    public let uv: Int
    public let condition: Condition
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dayContainer = try container.nestedContainer(keyedBy: DayCodingKeys.self, forKey: .day)
        self.maxTemp = Int(try dayContainer.decode(Double.self, forKey: .maxTemp))
        self.minTemp = Int(try dayContainer.decode(Double.self, forKey: .minTemp))
        self.chanceOfRain = try dayContainer.decode(Double.self, forKey: .chanceOfRain)
        self.uv = Int(try dayContainer.decode(Double.self, forKey: .uv))
        self.condition = try dayContainer.decode(Condition.self, forKey: .condition)

        let astroContainer = try container.nestedContainer(keyedBy: AstroCodingKeys.self, forKey: .astro)
        let a12HourSunriseDate = try astroContainer.decode(String.self, forKey: .sunrise)
        let a12HourSunsetDate = try astroContainer.decode(String.self, forKey: .sunset)
        
        self.sunrise = ForecastDay.convertTo24HourDate(a12HourSunriseDate)
        self.sunset = ForecastDay.convertTo24HourDate(a12HourSunsetDate)
        
    }

    public init(condition: Condition) {
        self.maxTemp = 0
        self.minTemp = 0
        self.chanceOfRain = 0
        self.sunrise = ""
        self.sunset = ""
        self.uv = 0
        self.condition = condition
    }
    
}


fileprivate extension ForecastDay {
    
    static func convertTo24HourDate(_ a12HourDateString: String) -> String {
        let dateAsString = a12HourDateString
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // fixes nil if device time in 24 hour format
        
        guard let date = dateFormatter.date(from: dateAsString)
        else { return "" }
        
        dateFormatter.dateFormat = "HH:mm"
        let a24HourDate = dateFormatter.string(from: date)
        
        return a24HourDate
    }
    
}
