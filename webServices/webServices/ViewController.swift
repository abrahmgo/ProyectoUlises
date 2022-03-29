//
//  ViewController.swift
//  webServices
//
//  Created by Andrés Bonilla Gómez on 28/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblFact: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadData()
    }
    
    // free apis https://apipheny.io/free-api/
    // json pretty https://jsonformatter.org
    
    func downloadData() {
        
        let network = AlamofireRequest()
        
        network.downloadData(url: "https://catfact.ninja/fact",
                             method: .get,
                             completion: { information in
            print("view controller")
            // Data -> UIImaga(date: data)
            
            guard let message = information["fact"] as? String else {
                return
            }
            
            DispatchQueue.main.async {
                self.lblFact.text = message
            }
        })
    }
}

