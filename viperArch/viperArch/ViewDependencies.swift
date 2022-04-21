//
//  ViewDependencies.swift
//  viperArch
//
//  Created by Andrés Bonilla Gómez on 20/04/22.
//

import Foundation
import UIKit

protocol ViewType {
    var presenter: PresenterType? { get set }
    
    func show(message: String)
}

protocol RouterType {
    var view: UIViewController? { get set }
    
    func goHome()
}

protocol PresenterType {
    var view: ViewType? { get set}
    var router: RouterType? { get set}
    var interactor: InteractorType? { get set}
    
    func doLogin(username: String, password: String)
}

protocol InteractorType {
    var presenter: PresenterType? { get set }
    
    func doLogin(auth: AuthEntityType) -> Bool
}
