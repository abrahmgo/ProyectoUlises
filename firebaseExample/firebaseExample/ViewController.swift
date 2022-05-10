//
//  ViewController.swift
//  firebaseExample
//
//  Created by Andrés Bonilla Gómez on 09/05/22.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkStatusLogin()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        removeStatusLoginListener()
    }

    @IBAction func makeLogin(_ sender: Any) {
        let email = txtEmail.text!
        let password = txtPassword.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.show(message: error!.localizedDescription)
            } else {
                // ir al home o a otra vista
                dump(result)
            }
        }
        
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        let email = txtEmail.text!
        let password = txtPassword.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if error != nil {
                self.show(message: error!.localizedDescription)
            } else {
                // ir al home o a otra vista
                dump(result)
            }
        }
    }
    
    func checkStatusLogin() {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            print(auth)
            print(user)
        }
    }
    
    func removeStatusLoginListener() {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    
    func show(message: String) {
        let alertViewController = UIAlertController(title: "Warning", message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertViewController.addAction(action)
        present(alertViewController, animated: true, completion: nil)
    }
}

