//
//  MainInteractorInterface.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/23/21.
//

import Foundation

protocol MainInteractorInterface: InteractorPresenterInterface {

    func getWeatherFor(_ coordinate: Coordinate, completion: @escaping (Result<Weather, Error>) -> Void)
}

