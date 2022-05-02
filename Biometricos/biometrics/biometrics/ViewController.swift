//
//  ViewController.swift
//  biometrics
//
//  Created by Andrés Bonilla Gómez on 01/05/22.
//

import UIKit

class ViewController: UIViewController {

    let biometrics = Biometrics()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func biometric(_ sender: Any) {
        biometrics.askPermission { status, error in
            if status {
                self.biometrics.askBiometric { status, error in
                    DispatchQueue.main.async {
                        self.showAlert(status: status)
                    }
                    print(error)
                }
            } else {
                print("Revisa los permisos de biometricos")
            }
        }
    }
    
    
    func showAlert(status: Bool) {
        let alerviewController = UIAlertController(title: "Status biometrico",
                                                   message: status ? "Paso" : "No paso", preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerviewController.addAction(buttonAction)
        present(alerviewController, animated: true, completion: nil)
    }
}

