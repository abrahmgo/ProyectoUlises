//
//  UserDefaults.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 02/03/22.
//

import Foundation


struct MainUserDefaults {
    
    static var defaults: UserDefaults? {
        // personalizacion
        return UserDefaults(suiteName: "MainUserDefaultsProyectoUlises")
    }
    
    enum Keys: String {
        case splash
        case volume
    }
    
    static var isSplash: Bool {
        set {
            defaults?.set(newValue, forKey: Keys.splash.rawValue)
            defaults?.synchronize()
        }
        
        get {
            return defaults?.value(forKey: Keys.splash.rawValue) as? Bool ?? false
        }
    }
    
    static var volume: Int {
        set {
            defaults?.set(newValue, forKey: Keys.volume.rawValue)
            defaults?.synchronize()
        }
        
        get {
            return defaults?.value(forKey: Keys.volume.rawValue) as? Int ?? 0
        }
    }
}
