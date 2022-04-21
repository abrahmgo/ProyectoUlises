//
//  LoginViewController.swift
//  Idioms
//
//  Created by Andrés Bonilla Gómez on 20/04/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = NSLocalizedString("login.title", comment: "titulo de vista de login")
    }
}
