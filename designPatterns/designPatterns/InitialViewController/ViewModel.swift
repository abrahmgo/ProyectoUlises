//
//  ViewModel.swift
//  designPatterns
//
//  Created by Andrés Bonilla Gómez on 06/04/22.
//

import Foundation

// ViewModel - Interactor
class ViewModel {
    
    init() { }
    
    func sum(numaA: String?, numB: String?) -> Int {
        
        guard let numaA = Int(numaA ?? "0"),
              let numB = Int(numB ?? "0") else {
            return 0
        }

        return MathOperations.shared.sum(numA: numaA, numB: numB)
    }
}
