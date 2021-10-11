//
//  Location.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/14/21.
//

import Foundation


public struct Location: Decodable {
    public let name: String
    public let region: String
    public let country: String
    public let coordinate: Coordinate
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = (try? container.decodeIfPresent(String.self, forKey: .name)) ?? ""
        self.region = (try? container.decodeIfPresent(String.self, forKey: .region)) ?? ""
        self.country = (try? container.decodeIfPresent(String.self, forKey: .country)) ?? ""
        self.coordinate = try Coordinate(from: decoder)
    }


}

public struct Coordinate: Decodable {
    let lat: Double
    let lon: Double
}
