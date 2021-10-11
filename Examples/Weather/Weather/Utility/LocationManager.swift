//
//  LocationFetcher.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/15/21.
//

import Foundation
import CoreLocation


class LocationManager: NSObject {
    
    let locationManager = CLLocationManager()
    
    var locationHandler: ((CLLocation) -> Void)?
    
    private let accuracy = kCLLocationAccuracyKilometer
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.activityType = .other
    }
    
    
    public func getCurrentLocation(_ locationHandler: @escaping (CLLocation) -> Void) {
        self.locationHandler = locationHandler
        requestForLocatoin()
    }
    
    private func requestForLocatoin() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
            
        case .notDetermined:
            self.locationManager.requestWhenInUseAuthorization()
            
        default:
            break
        }
    }
    
    
}


extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestForLocatoin()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        guard let location = locations.last, location.horizontalAccuracy <= accuracy else {
            return
        }
        self.locationHandler?(location)
    }
    
    
}
