//
//  MainPresenter.swift
//  Main
//
//  Created by Seyed Samad on 9/13/21.
//

import Foundation
import UIKit

final class MainPresenter: PresenterInterface {

    var router: MainRouterInterface!
    var interactor: MainInteractorInterface!
    weak var view: MainViewInterface!

    let locationManager = LocationManager()
    
    var weather: Weather! {
        didSet {
            view.reload()
        }
    }
    
}

extension MainPresenter: MainPresenterRouterInterface {

}

extension MainPresenter: MainPresenterInteractorInterface {

}

extension MainPresenter: MainPresenterViewInterface {
    
    var locationName: String {
        weather.location.name
    }
    
    var currentTemp: String {
        "\(weather.current.temp)"
    }
    
    var currentCondition: String {
        weather.current.condition.title
    }
    
    var lowTemp: String {
        "L:\(weather.forecastDay.minTemp)˚"
    }
    
    var hightTemp: String {
        "H:\(weather.forecastDay.maxTemp)˚"
    }
    
    var isDay: Bool {
        weather.current.isDay
    }
    
    func updateConditionImage(for imageView: UIImageView) {
        let url = weather.current.condition.iconURL
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            }
            catch {
                
            }
        }
    }

    var viewModel: [MainViewModel] {
        weather?.viewModel ?? []
    }
    
    
    func viewDidLoad() {
        locationManager.getCurrentLocation { [weak self] location in
            guard let `self` = self else { return }
            
            let coordinate = location.coordinate
            self.interactor.getWeatherFor(Coordinate(lat: coordinate.latitude, lon: coordinate.longitude)) { result in
                DispatchQueue.main.async {
                    
                    switch result {
                    case .success(let weather):
                        self.weather = weather
                        
                    case .failure:
                        break
                    }
                    
                    
                }
            }
        }
    }
    
    func numberOfRows(at section: Int) -> Int {
        viewModel.count
    }
    
    func item(for indexPath: IndexPath) -> MainViewModel {
        viewModel[indexPath.row]
    }
    
    

}
