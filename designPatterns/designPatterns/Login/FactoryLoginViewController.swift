//
//  FactoryLoginViewController.swift
//  designPatterns
//
//  Created by Andrés Bonilla Gómez on 06/04/22.
//

import Foundation

struct FactoryLoginViewController {
    
    func getLoginViewController(delegate: LoginViewControllerDelegate) -> LoginViewController {
        
        let loginViewModelMexico = LoginViewModelMexico()
        let loginViewController = LoginViewController(loginViewModel: loginViewModelMexico)
        loginViewController.delegate = delegate
        return loginViewController
    }
}
