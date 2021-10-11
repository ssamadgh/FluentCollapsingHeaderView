//
//  MainPresenterViewInterface.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/23/21.
//

import UIKit

protocol MainPresenterViewInterface: PresenterViewInterface {
    func viewDidLoad()
    func numberOfRows(at section: Int) -> Int
    func item(for indexPath: IndexPath) -> MainViewModel
    var locationName: String { get }
    var currentTemp: String { get }
    var currentCondition: String { get }
    var lowTemp: String { get }
    var hightTemp: String { get }
    var isDay: Bool { get }
    func updateConditionImage(for imageView: UIImageView)
    
}
