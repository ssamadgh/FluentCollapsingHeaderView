//
//  MainInteractor.swift
//  Main
//
//  Created by Seyed Samad on 9/13/21.
//

import Foundation

final class MainInteractor: InteractorInterface {

    weak var presenter: MainPresenterInteractorInterface!
}

extension MainInteractor: MainInteractorInterface {
    
    func getWeatherFor(_ coordinate: Coordinate, completion: @escaping (Result<Weather, Error>) -> Void) {
        let url = WeatherURL.forecast(forQuery: "\(coordinate.lat),\(coordinate.lon)")
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let weather = try JSONDecoder().decode(Weather.self, from: data)
                    completion(.success(weather))
                } catch {
                    completion(.failure(error))
                }
            }
            
        }
        .resume()
    }
    

}
