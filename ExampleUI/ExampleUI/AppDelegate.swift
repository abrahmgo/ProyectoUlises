//
//  AppDelegate.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 16/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

        let initialViewController = InitialViewController(nibName: "InitialViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: initialViewController)
        
        let window = UIWindow()
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }
    
    
    // investigar que funcion de app delegate, te avisa, cuando muere/crashea, cuando es interrumpiada, y las funciones cuando la minimizas y regresas a la app, 
}
