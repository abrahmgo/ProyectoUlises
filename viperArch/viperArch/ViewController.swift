//
//  ViewController.swift
//  viperArch
//
//  Created by Andrés Bonilla Gómez on 20/04/22.
//

import UIKit

class ViewController: UIViewController {

    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.doLogin(username: "fdsfds", password: "ddfsdsf")
    }
}

extension ViewController: ViewType {
    
    func show(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("mostrando mensaje \(message)")
        }
    }
}

