//
//  Location.swift
//  location
//
//  Created by Andrés Bonilla Gómez on 01/05/22.
//

import Foundation
import CoreLocation

class Location: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    var coordinates: CLLocation?
    
    func checkPermission() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                case .notDetermined, .restricted, .denied:
                    askPermission()
                case .authorizedAlways, .authorizedWhenInUse:
                    startLocation()
                @unknown default:
                    break
            }
        } else {
            print("Location services are not enabled")
        }
    }
    
    func askPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        coordinates = manager.location
    }
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       error)
        }
    }
}
