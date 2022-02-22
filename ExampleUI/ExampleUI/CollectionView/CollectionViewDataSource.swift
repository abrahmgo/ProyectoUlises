//
//  CollectionViewDataSource.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 21/02/22.
//

import Foundation
import UIKit

extension CollectionViewController: UICollectionViewDataSource {
    
    // numero de celdas por seccion
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    // celda
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell",
                                                            for: indexPath) as? TitleCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        if indexPath.row < 10 {
            cell.update(text: "Hola esta es una celda", color: .blue)
        } else {
            cell.update(text: "Adios es es una celda", color: .blue)
        }
        
        return cell
    }
}

/*
 
 1. añadir otra seccion
 2. añadir otra celda customizada
 3. combinar las 2 celdas en la misma seccion
 
 */
