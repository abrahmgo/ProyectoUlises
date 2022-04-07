//
//  LoginViewController.swift
//  designPatterns
//
//  Created by Andrés Bonilla Gómez on 06/04/22.
//

import UIKit

// notification center, programacion reactiva, closures
protocol LoginViewControllerDelegate: AnyObject {
    func buttonPressed()
}

class LoginViewController: UIViewController {
    
    var button: UIButton?
    let loginViewModel: LoginViewModelType
    weak var delegate: LoginViewControllerDelegate?
    
    init(loginViewModel: LoginViewModelType) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        createButton()
    }
    
    func suma() {
        let multi = MathOperations.shared.multi(numA: 40, numB: 100)
        print(multi)
    }
    
    func createButton() {
        let frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button = UIButton(frame: frame)
        button?.center = view.center
        button?.setTitle("Push me", for: .normal)
        button?.setTitleColor(.black, for: .normal)
        guard let button = button else {
            return
        }

        view.addSubview(button)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
    }
    
    @objc func pressButton() {
        print("click")
        delegate?.buttonPressed()
    }
}
