//
//  ViewController.swift
//  location
//
//  Created by Andrés Bonilla Gómez on 01/05/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    private let location = Location()
    private var coordinates: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        location.checkPermission()
        // Do any additional setup after loading the view.
    }

    @IBAction func permission(_ sender: Any) {
        location.askPermission()
    }
    
    @IBAction func coordinates(_ sender: Any) {
        coordinates = location.coordinates
        print(coordinates?.coordinate.latitude)
        print(coordinates?.coordinate.longitude)
    }
    
    @IBAction func city(_ sender: Any) {
        guard let coordinates = coordinates else {
            return
        }

        location.fetchCityAndCountry(from: coordinates) { city, country, error in
            print(city)
            print(country)
            print(error)
        }
    }
}

