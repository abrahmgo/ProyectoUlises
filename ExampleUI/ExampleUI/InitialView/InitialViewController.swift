//
//  InitialViewController.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 16/02/22.
//

import UIKit

class InitialViewController: UIViewController {
    
//    override class func load() {
//
//    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    
    deinit {
        
    }
    
    
    @IBAction func goToSecondView(_ sender: Any) {
        let viewControllerWithCode = ViewWithCodeViewController()
//        present(viewControllerWithCode, animated: true, completion: nil)
        navigationController?.pushViewController(viewControllerWithCode, animated: true)
    }
}


