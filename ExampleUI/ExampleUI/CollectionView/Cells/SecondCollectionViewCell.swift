//
//  SecondCollectionViewCell.swift
//  ExampleUI
//
//  Created by Ulises Eliseo on 2/28/22.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle2: UILabel!
    
    func update(text: String, color: UIColor) {
        lblTitle2.text = text
        lblTitle2.textColor = color
    }
}
