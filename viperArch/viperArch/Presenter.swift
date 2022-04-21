//
//  Presenter.swift
//  viperArch
//
//  Created by Andrés Bonilla Gómez on 20/04/22.
//

import Foundation

class Presenter: PresenterType {
    
    var view: ViewType?
    var router: RouterType?
    var interactor: InteractorType?
    
    func doLogin(username: String, password: String) {
        
        let authEntity = AuthEntity(username: username, password: password)
        let status = interactor?.doLogin(auth: authEntity) ?? false
        if status {
            view?.show(message: "login exitoso")
        } else {
            view?.show(message: "error, verifique sus datos")
        }
    }
}
