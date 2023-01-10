//
//  Stack.swift
//  TDDSession
//
//  Created by BKS-GGS on 09/01/23.
//

import Foundation

// Stack using Array
// Last in First Out

class Stack {
    var array = Array<Int>()

    func push(element: Int?) {
        guard let element = element else {
            return
        }
        array.insert(element, at: 0)
    }
   
    func pop() {
        guard !isEmpty() else {
            return
        }
        array.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    func size() -> Int {
        return array.count
    }
}
