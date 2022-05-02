//
//  Biometrics.swift
//  biometrics
//
//  Created by Andrés Bonilla Gómez on 01/05/22.
//

import Foundation
import LocalAuthentication

class Biometrics {
    
    private var context = LAContext()
    
    func askPermission(completion: @escaping (_ status: Bool,
                                             _ error: Error?) -> ()) {
        var error: NSError?

        // Check for biometric authentication
        // permissions
        let permissions = context.canEvaluatePolicy(
            .deviceOwnerAuthentication,
            error: &error
        )

        if permissions {
            completion(true, nil)
        } else {
           completion(false, error)
        }
    }
    
    
    func askBiometric(completion: @escaping (_ status: Bool,
                                             _ error: Error?) -> ()) {
        let reason = "Log in with Face ID"
        context.evaluatePolicy(
            // .deviceOwnerAuthentication allows
            // biometric or passcode authentication
            .deviceOwnerAuthentication,
            localizedReason: reason
        ) { success, error in
            if success {
                completion(success, nil)
            } else {
                completion(false, error)
            }
        }
    }
}
