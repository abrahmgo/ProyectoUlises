//
//  TitleCollectionViewCell.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 21/02/22.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    func update(text: String, color: UIColor) {
        lblTitle.text = text
        lblTitle.textColor = color
    }
}
