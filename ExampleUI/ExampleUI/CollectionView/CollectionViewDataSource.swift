//
//  CollectionViewDataSource.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 21/02/22.
//

import Foundation
import UIKit

extension CollectionViewController: UICollectionViewDataSource {
    
    // 1. Añadir otra seccion
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    // Número de celdas por sección. For default es sólo una sección
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 20
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    // celda
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell",
                                                            for: indexPath) as? TitleCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        guard let cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell",
                                                            for: indexPath) as? SecondCollectionViewCell else {
            
            return UICollectionViewCell()
        }

        
//        if indexPath.row < 10 {
//            cell.update(text: "Hola esta es una celda", color: .blue)
//        } else {
//            cell.update(text: "Adios es es una celda", color: .blue)
//        }
        
        
        // Estas validando la sección
        if indexPath.section == 0 {
            cellTwo.update(text: "Esta es la seccion 1", color: .purple)
            
            return cellTwo
            
        } else {
            // estas validando las celdas
//          cell.update(text: "Esta es la seccion 2", color: .blue)
            if indexPath.row % 2 == 0 {
                        cellTwo.update(text: "Hola, esta es una celda", color: .blue)
                    } else {
                        cellTwo.update(text: "Adiós, es es una celda", color: .blue)
                    }
            return cellTwo

        }
    }
    
    

}

/*
 
 1. añadir otra seccion
 2. añadir otra celda customizada
 3. combinar las 2 celdas en la misma seccion
 4. Investgar if indexPath.row % 2 == 0
 
 Mínimo una celda nueva.

 Agragar la celda y ten cuidado con el return cell, se añade uno.
 
 
 */
