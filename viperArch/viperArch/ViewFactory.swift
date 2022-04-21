//
//  ViewFactory.swift
//  viperArch
//
//  Created by Andrés Bonilla Gómez on 20/04/22.
//

import Foundation
import UIKit

struct LoginFactory {
    
    static func buildLogin() -> UIViewController {
        
        var view: ViewType = ViewController(nibName: "ViewController", bundle: nil)
        var router: RouterType = Router()
        var presenter: PresenterType = Presenter()
        var interactor: InteractorType = Interactor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        guard let loginViewController = view as? UIViewController else {
            return UIViewController()
        }
        
        router.view = loginViewController
        return loginViewController
    }
}
