//
//  NotificationCenter.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 09/03/22.
//

import Foundation
import UIKit

class ModuleNotificationCenter {
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willResignActive),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
    }
    
    @objc func willResignActive(completionHandler block: @escaping () -> Void) {
        print("background")
        block()
    }
}
