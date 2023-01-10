//
//  Calculator.swift
//  TDDSession
//
//  Created by BKS-GGS on 09/01/23.
//

import Foundation

struct Calculator {
    
    //MARK: - Todo
//    private func isValueAreExists(_ n1: Int?, _ n2: Int?) -> (Int, Int) {
//        guard let n1 = n1,
//              let n2 = n2
//        else { return false }
//        return true
//    }
    
    //Refactor!
    func addition(n1: Int?, n2: Int?) -> Int? {
        guard let n1 = n1,
              let n2 = n2
        else { return nil }
        return n1+n2
    }
    
    func subraction(n1: Int?, n2: Int?) -> Int? {
        guard let n1 = n1,
              let n2 = n2
        else { return nil }
        return n1-n2
    }
    
    func multiplication(n1: Int?, n2: Int?) -> Int? {
        guard let n1 = n1,
              let n2 = n2
        else { return nil }
        return n1*n2
    }
    
    func division(n1: Int?, n2: Int?) -> Int? {
        guard let n1 = n1,
              let n2 = n2
        else { return nil }
        return n1/n2
    }
    
    
}
