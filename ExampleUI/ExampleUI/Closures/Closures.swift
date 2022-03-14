//
//  Closures.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 09/03/22.
//

import Foundation

struct Closures {
        
    func doLogin(user: String, completionHandler block: @escaping (Bool) -> Void) {
        /*
         dentro de esta funcion, mandamos la peticion, se evaluan las credenciales
         sucede todo el proceso de login
         */
        
        //foto
        
        /*
         
         [[3123,432432], [312312,213123]] funciones high order
         
         */
        
        block(false)
    }
}
