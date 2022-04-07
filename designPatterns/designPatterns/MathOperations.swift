//
//  MathOperations.swift
//  designPatterns
//
//  Created by Andrés Bonilla Gómez on 06/04/22.
//

import Foundation

// singleton
class MathOperations {
    
    static let shared = MathOperations()
    
    func sum(numA: Int, numB: Int) -> Int {
        return numA + numB
    }
    
    func multi(numA: Int, numB: Int) -> Int {
        return numA * numB
    }
    
    func div(numA: Int, numB: Int) -> Int {
        return numA / numB
    }
    
    func res(numA: Int, numB: Int) -> Int {
        return numA - numB
    }
}
