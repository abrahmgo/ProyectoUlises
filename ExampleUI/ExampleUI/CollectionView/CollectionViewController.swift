//
//  CollectionViewController.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 21/02/22.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(UINib(nibName: "TitleCollectionViewCell", bundle: nil),
                                    forCellWithReuseIdentifier: "TitleCollectionViewCell")
            
            collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil),
                                    forCellWithReuseIdentifier: "SecondCollectionViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }
        
        // Create list layout
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .plain)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)

        collectionView.collectionViewLayout = listLayout

    }
}

extension CollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("toco alguna celda")
        // logica para validar que celda toco? numero y seccion
        print(indexPath.row)
    }
}
