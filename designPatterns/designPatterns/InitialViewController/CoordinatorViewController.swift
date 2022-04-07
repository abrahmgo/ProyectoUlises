//
//  CoordinatorViewController.swift
//  designPatterns
//
//  Created by Andrés Bonilla Gómez on 06/04/22.
//

import UIKit

// Coordinator - Router
class CoordinatorViewController {
    
    let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func goToLogin() {
        let loginViewController = FactoryLoginViewController().getLoginViewController(delegate: viewController)
        viewController.present(loginViewController,
                               animated: true,
                               completion: nil)
    }
    
    func show(message: String) {
        let alertController = UIAlertController(title: "Alerta",
                                            message: message,
                                            preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(buttonAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func goToLogin(message: String) {
        let alertController = UIAlertController(title: "Alerta",
                                            message: message,
                                            preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.goToLogin()
        }
        alertController.addAction(buttonAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
