//
//  ViewController.swift
//  designPatterns
//
//  Created by Andrés Bonilla Gómez on 06/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtNumA: UITextField!
    @IBOutlet weak var txtNumB: UITextField!
    
    var viewModel: ViewModel?
    var coordinator: CoordinatorViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        coordinator = CoordinatorViewController(viewController: self)
    }
    
    @IBAction func sum(_ sender: Any) {
        
        let numA = txtNumA.text
        let numB = txtNumB.text
        
        
        let result = viewModel?.sum(numaA: numA, numB: numB)
        lblResult.text = "\(result ?? 0)"
    }
    
    @IBAction func goLogin(_ sender: Any) {
        coordinator?.goToLogin(message: "Estas yendo a login")
    }
}

extension ViewController: LoginViewControllerDelegate {
    
    func buttonPressed() {
        print("presiono botton en login view controller y estamos en otro view cotnroller")
    }
}
