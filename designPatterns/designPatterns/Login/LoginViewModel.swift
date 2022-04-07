//
//  LoginViewModel.swift
//  designPatterns
//
//  Created by Andrés Bonilla Gómez on 06/04/22.
//

import Foundation

protocol LoginViewModelType {
    func makeLogin(username: String, password: String) -> Bool
}

class LoginViewModelArgentina: LoginViewModelType {
    
    init () { }
    
    func makeLogin(username: String, password: String) -> Bool {
        /*
         logica, dni, direccion, peso, edad
         */
        return false
    }
}

class LoginViewModelMexico: LoginViewModelType {
    
    init () { }
    
    func makeLogin(username: String, password: String) -> Bool {
        /*
         logica, curp, ine, amigos, estudios
         */
        return false
    }
}
