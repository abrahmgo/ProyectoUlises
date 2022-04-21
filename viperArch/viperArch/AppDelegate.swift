//
//  AppDelegate.swift
//  viperArch
//
//  Created by Andrés Bonilla Gómez on 19/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let loginViewController = LoginFactory.buildLogin()
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

