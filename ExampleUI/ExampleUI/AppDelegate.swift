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


// investigar que funcion de app delegate, te avisa, cuando muere/crashea, cuando es interrumpiada, y las funciones cuando la minimizas y regresas a la app.



func applicationDidBecomeActive(_: UIApplication){
    print("Se activo la applicación")
}
//    Tells the delegate that the app has become active.

func applicationWillResignActive(_: UIApplication){
    print("Application will resign")
}
//    Tells the delegate that the app is about to become inactive.

func applicationDidEnterBackground(_: UIApplication){
    print("Application did enter background")
}
//    Tells the delegate that the app is now in the background.

func applicationWillEnterForeground(_: UIApplication){
    print("Application will enter foreground")
}
//    Tells the delegate that the app is about to enter the foreground.

func applicationWillTerminate(_: UIApplication){
    print("application will terminate")
}

}
