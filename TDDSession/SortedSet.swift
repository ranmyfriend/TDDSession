//
//  SortedSet.swift
//  TDDSession
//
//  Created by BKS-GGS on 09/01/23.
//

import Foundation
/*

PROBLEM STATEMENT : Sorted Set

You have an array :

condition : 1. it shouldnot allow duplicate element 2. every time you insert it , array items should fall in ascending order


1. addElement - >>

2. addAll

3. max

4. min

5. deleteItemFromIndex -> -1 , 0 -->>

6. isExist -->>


*/

class SortedSet {
    var array = Array<Int>()
    
    func addElement(number: Int?) {
        guard let number = number,
              !isExists(number: number)
        else {
            return
        }
        array.append(number)
        array = array.sorted()
    }
    
    func addAll(numbers: [Int]?) {
        guard let numbers = numbers else {
            return
        }
        numbers.forEach { addElement(number: $0) }
    }
    
    func max() -> Int? {
        guard !array.isEmpty else {
            return nil
        }
        return array.last
    }
    
    func min() -> Int? {
        guard !array.isEmpty else {
            return nil
        }
        return array.min()
    }
    
    func deleteItemFromIndex(index: Int?) {
        guard let index = index,
              index >= 0,
              index < array.count else {
            return
        }
        array.remove(at: index)
    }
    
    func isExists(number: Int?) -> Bool {
        guard let number = number else {
            return false
        }
        return array.contains(number)
    }
    
}
