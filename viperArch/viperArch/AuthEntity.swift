//
//  AuthEntity.swift
//  viperArch
//
//  Created by Andrés Bonilla Gómez on 20/04/22.
//

import Foundation

struct AuthEntity: AuthEntityType {
    
    var username: String
    var password: String
}

protocol AuthEntityType {
    var username: String { get set }
    var password: String { get set }
}
