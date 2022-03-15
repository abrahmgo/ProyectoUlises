//
//  InitialViewController.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 16/02/22.
//

import UIKit

class InitialViewController: UIViewController {

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
    
    @IBAction func goToSecondView(_ sender: Any) {
        let viewControllerWithCode = CollectionViewController(nibName: "CollectionViewController", bundle: nil)
        navigationController?.pushViewController(viewControllerWithCode, animated: true)
        print("push")
    }
}


