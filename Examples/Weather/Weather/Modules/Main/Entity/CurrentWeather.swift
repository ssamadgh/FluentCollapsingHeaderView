//
//  CurrentWeather.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/14/21.
//

import Foundation

public struct CurrentWeather: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp_c"
        case isDay = "is_day"
        case condition
        case feelslike = "feelslike_c"
        case pressure = "pressure_in"
        case precipitation = "precip_in"
        case humidity = "humidity"
        case uv = "uv"
        case visibility = "vis_km"
    }

    public let temp: Int
    public let isDay: Bool
    public let wind: Wind
    public let condition: Condition
    public let feelslike: Double
    public let pressure: Double
    public let precipitation: Double
    public let humidity: Double
    public let uv: Int
    public let visibility: Double
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp = Int(try container.decode(Double.self, forKey: .temp))
        let isDay = try container.decode(Int.self, forKey: .isDay)
        self.isDay = isDay  != 0
        self.wind = try Wind(from: decoder)
        self.condition = try container.decode(Condition.self, forKey: .condition)
        self.feelslike = try container.decode(Double.self, forKey: .feelslike)
        self.pressure = try container.decode(Double.self, forKey: .pressure)
        self.precipitation = try container.decode(Double.self, forKey: .precipitation)
        self.humidity = try container.decode(Double.self, forKey: .humidity)
        self.uv = Int(try container.decode(Double.self, forKey: .uv))
        self.visibility = try container.decode(Double.self, forKey: .visibility)
    }
    
    
}

public struct Wind: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case speed = "wind_kph"
        case degree = "wind_degree"
        case dir = "wind_dir"
    }

    let speed: Double
    let degree: Double
    let dir: String
}

public struct Condition: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case title = "text", iconURL = "icon"
    }
    
    let title: String
    let iconURL: URL
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        let iconURL = try container.decode(String.self, forKey: .iconURL)
        self.iconURL = URL(string: "https:\(iconURL)")!
    }
    
}
