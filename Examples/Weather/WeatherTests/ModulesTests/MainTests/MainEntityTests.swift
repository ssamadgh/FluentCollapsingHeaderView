//
//  TestDecodingForcastModel.swift
//  WeatherTests
//
//  Created by Seyed Samad Gholamzadeh on 9/14/21.
//

import XCTest
@testable import Weather

class TestDecodingForcastModel: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecodingForcastJson() throws {
        
        do {
            let model = try JSONDecoder().decode(Weather.self, from: forcastJson)
            print(model.current.condition.iconURL)
        } catch {
            XCTAssert(false, "\(error)")
        }
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


let forcastJson =
#"""
    {
      "location": {
        "name": "Jamshidiyeh",
        "region": "Tehran",
        "country": "Iran",
        "lat": 35.72,
        "lon": 51.38,
        "tz_id": "Asia/Tehran",
        "localtime_epoch": 1631596964,
        "localtime": "2021-09-14 9:52"
      },
      "current": {
        "last_updated_epoch": 1631596500,
        "last_updated": "2021-09-14 09:45",
        "temp_c": 32.0,
        "temp_f": 89.6,
        "is_day": 1,
        "condition": {
          "text": "Sunny",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
          "code": 1000
        },
        "wind_mph": 13.6,
        "wind_kph": 22.0,
        "wind_degree": 90,
        "wind_dir": "E",
        "pressure_mb": 1016.0,
        "pressure_in": 30.0,
        "precip_mm": 0.0,
        "precip_in": 0.0,
        "humidity": 11,
        "cloud": 0,
        "feelslike_c": 29.8,
        "feelslike_f": 85.6,
        "vis_km": 10.0,
        "vis_miles": 6.0,
        "uv": 1.0,
        "gust_mph": 8.1,
        "gust_kph": 13.0
      },
      "forecast": {
        "forecastday": [
          {
            "date": "2021-09-14",
            "date_epoch": 1631577600,
            "day": {
              "maxtemp_c": 36.3,
              "maxtemp_f": 97.3,
              "mintemp_c": 24.2,
              "mintemp_f": 75.6,
              "avgtemp_c": 29.3,
              "avgtemp_f": 84.7,
              "maxwind_mph": 11.2,
              "maxwind_kph": 18.0,
              "totalprecip_mm": 0.0,
              "totalprecip_in": 0.0,
              "avgvis_km": 10.0,
              "avgvis_miles": 6.0,
              "avghumidity": 12.0,
              "daily_will_it_rain": 0,
              "daily_chance_of_rain": 0,
              "daily_will_it_snow": 0,
              "daily_chance_of_snow": 0,
              "condition": {
                "text": "Sunny",
                "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                "code": 1000
              },
              "uv": 8.0
            },
            "astro": {
              "sunrise": "06:46 AM",
              "sunset": "07:13 PM",
              "moonrise": "02:48 PM",
              "moonset": "No moonset",
              "moon_phase": "Waxing Gibbous",
              "moon_illumination": "62"
            }
          }
        ]
      }
    }
"""#.data(using: .utf8)!
