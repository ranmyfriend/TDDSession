//
//  Queue.swift
//  TDDSession
//
//  Created by BKS-GGS on 09/01/23.
//

import Foundation

// Queue using Array
// First in First Out

class Queue {
    var array = Array<Int>()
    private(set) var top = -1

    func enqueue(element: Int?) {
        guard let element = element else {
            return
        }
        array.append(element)
        top += 1
    }
   
    func dequeue() {
        guard !isEmpty() else {
            return
        }
        array.removeLast()
        top -= 1
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    func size() -> Int {
        return array.count
    }
    
    func peek() -> Int? {
        guard top >= 0 else {
            return nil
        }
        return array[top]
    }
}
