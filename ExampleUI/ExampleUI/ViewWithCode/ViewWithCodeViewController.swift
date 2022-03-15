//
//  ViewWithCodeViewController.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 16/02/22.
//

//import UIKit
//
//class ViewWithCodeViewController: UIViewController {
//    
//    var lblTitle: UILabel?
//    
//    override func viewDidLoad() {
//        view.backgroundColor = .white
//        
//        setUI()
//    }
//    
//    func setUI() {
//        let lblSize = CGSize(width: 200, height: 100)
//        let lblPosition = CGPoint(x: 200, y: 100)
//        let lblFrame = CGRect(origin: lblPosition, size: lblSize)
//        lblTitle = UILabel(frame: lblFrame)
//        lblTitle?.text = "View Controller with code"
//        
//        guard let lblTitle = lblTitle else {
//            return
//        }
//
//        view.addSubview(lblTitle)
//    }
//    
//    deinit {
//        lblTitle = nil
//    }
//}
