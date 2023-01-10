//
//  TDDSessionTests.swift
//  TDDSessionTests
//
//  Created by BKS-GGS on 09/01/23.
//

import XCTest
@testable import TDDSession

final class TDDSessionTests: XCTestCase {
    
    var calculator: Calculator?
    var sortedSet: SortedSet?
    var stack: Stack?
    var queue: Queue?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator = Calculator()
        sortedSet = SortedSet()
        stack = Stack()
        queue = Queue()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        calculator = nil
        sortedSet = nil
        stack = nil
        queue = nil
    }

    //MARK: - Calculator Tests
    func testAddition() {
        let result = calculator?.addition(n1: 7, n2: 2)
        XCTAssertEqual(result, 9)
        
        let resultWithNil = calculator?.addition(n1: 7, n2: nil)
        XCTAssertNil(resultWithNil)

        let resultWithBothNil = calculator?.addition(n1: nil, n2: nil)
        XCTAssertNil(resultWithBothNil)
    }
    
    func testSubration() {
        let result = calculator?.subraction(n1: 7, n2: 2)
        XCTAssertEqual(result, 5)
        
        let resultWithNil = calculator?.subraction(n1: 7, n2: nil)
        XCTAssertNil(resultWithNil)

        let resultWithBothNil = calculator?.subraction(n1: nil, n2: nil)
        XCTAssertNil(resultWithBothNil)
    }
    
    func testMultiplication() {
        let result = calculator?.multiplication(n1: 7, n2: 2)
        XCTAssertEqual(result, 14)
        
        let resultWithNil = calculator?.multiplication(n1: 7, n2: nil)
        XCTAssertNil(resultWithNil)

        let resultWithBothNil = calculator?.multiplication(n1: nil, n2: nil)
        XCTAssertNil(resultWithBothNil)
    }
    
    func testDivision() {
        let result = calculator?.division(n1: 7, n2: 2)
        XCTAssertEqual(result, 3)
        
        let resultWithNil = calculator?.division(n1: 7, n2: nil)
        XCTAssertNil(resultWithNil)

        let resultWithBothNil = calculator?.division(n1: nil, n2: nil)
        XCTAssertNil(resultWithBothNil)
    }
    
    //MARK: - Sorted set Tests
    func testAddElement() {
        guard let sortedSet = sortedSet else {
            fatalError()
        }
        XCTAssertTrue(sortedSet.array.isEmpty)
        
        sortedSet.addElement(number: 5)
        XCTAssertTrue(sortedSet.array.contains(5))
        
        //Duplicate fail
        sortedSet.addElement(number: 5)
        XCTAssertTrue(sortedSet.array.count == 1)
        
        sortedSet.addElement(number: nil)
        XCTAssertTrue(sortedSet.array.count == 1)
    }
    
    func testAddAll() {
        guard let sortedSet = sortedSet else {
            fatalError()
        }
        XCTAssertTrue(sortedSet.array.isEmpty)

        sortedSet.addAll(numbers: [4,1,2,3])
        XCTAssertTrue(sortedSet.array.count == 4)
        
        XCTAssertEqual(sortedSet.array, [1,2,3,4])

        sortedSet.addAll(numbers: nil)
        XCTAssertTrue(sortedSet.array.count == 4)
    }
    
    func testMax() {
        guard let sortedSet = sortedSet else {
            fatalError()
        }
        XCTAssertTrue(sortedSet.array.isEmpty)

        let max = sortedSet.max()
        XCTAssertNil(max)

        sortedSet.addAll(numbers: [10,20,100])
        XCTAssertTrue(sortedSet.array.count == 3)
        
        let max100 = sortedSet.max()
        XCTAssertEqual(100, max100)
    }
    
    
    func testMin() {
        guard let sortedSet = sortedSet else {
            fatalError()
        }
        XCTAssertTrue(sortedSet.array.isEmpty)

        let min = sortedSet.min()
        XCTAssertNil(min)

        sortedSet.addAll(numbers: [10,20,100])
        XCTAssertTrue(sortedSet.array.count == 3)
        
        let min10 = sortedSet.min()
        XCTAssertEqual(10, min10)
    }
    
    func testDeleteItemFromIndex() {
        guard let sortedSet = sortedSet else {
            fatalError()
        }
        XCTAssertTrue(sortedSet.array.isEmpty)
        
        sortedSet.addElement(number: 5)
        XCTAssertTrue(sortedSet.array.contains(5))
        
        sortedSet.deleteItemFromIndex(index: 0)
        XCTAssertTrue(sortedSet.array.isEmpty)

        let minusIndex = -88
        XCTAssertFalse(minusIndex >= 0 && minusIndex < sortedSet.array.count)

    }
    
    func testIsExist() {
        guard let sortedSet = sortedSet else {
            fatalError()
        }
        
        let numNil = sortedSet.isExists(number: nil)
        XCTAssertFalse(numNil)
        
        sortedSet.addElement(number: 4)

        let isExists = sortedSet.isExists(number: 4)
        XCTAssertTrue(isExists)

        let numberNotFound = sortedSet.isExists(number: -1)
        XCTAssertFalse(numberNotFound)

    }
    
    //MARK: - Stack Data Structure Tests

    func testPush() {
        guard let stack = stack else {
            return
        }
        XCTAssertTrue(stack.isEmpty())
        
        stack.push(element: 5)
        stack.push(element: 6)
        stack.push(element: 7)
        stack.push(element: 8)
        XCTAssertTrue(stack.array.contains(5))
        XCTAssertEqual(stack.array.count, 4)
        
        stack.push(element: nil)
        XCTAssertEqual(stack.array.count, 4)
        
        XCTAssertFalse(stack.array.contains(68))
        
    }
    
    func testPop() {
        guard let stack = stack else {
            return
        }
        XCTAssertTrue(stack.isEmpty())
        stack.push(element: 5)
        stack.push(element: 6)
        stack.push(element: 7)
        stack.push(element: 8)
        
        stack.pop()
        XCTAssertEqual(stack.array.first, 7)
        stack.pop()
        XCTAssertEqual(stack.array.first, 6)
        stack.pop()
        XCTAssertEqual(stack.array.first, 5)
        stack.pop()
        XCTAssertTrue(stack.isEmpty())

        stack.pop()

    }
    
    func testIsEmpty() {
        guard let stack = stack else {
            return
        }
        XCTAssertTrue(stack.isEmpty())
    }
    
    func testSize() {
        guard let stack = stack else {
            return
        }
        XCTAssertTrue(stack.isEmpty())
        
        stack.push(element: 5)
        stack.push(element: 6)
        stack.push(element: 7)
        stack.push(element: 8)
        
        XCTAssertEqual(stack.size(), 4)
    }
    
    //MARK: - Queue Data Structure Tests

    func testQueueEnQueue() {
        guard let queue = queue else {
            return
        }
        XCTAssertTrue(queue.isEmpty())
        
        queue.enqueue(element: 5)
        XCTAssertEqual(queue.size(), 1)
        queue.enqueue(element: 6)
        XCTAssertEqual(queue.size(), 2)
        queue.enqueue(element: 7)
        queue.enqueue(element: 8)
        XCTAssertTrue(queue.array.contains(5))
        XCTAssertEqual(queue.size(), 4)
        
        queue.enqueue(element: nil)
        XCTAssertEqual(queue.array.count, 4)
        
        XCTAssertFalse(queue.array.contains(68))
        
    }
    
    func testQueueDeQueue() {
        guard let queue = queue else {
            return
        }
        XCTAssertTrue(queue.isEmpty())
        queue.enqueue(element: 5)
        queue.enqueue(element: 6)
        queue.enqueue(element: 7)
        queue.enqueue(element: 8)
        
        queue.dequeue()
        XCTAssertEqual(queue.peek(), 7)
        queue.dequeue()
        XCTAssertEqual(queue.peek(), 6)
        queue.dequeue()
        XCTAssertEqual(queue.peek(), 5)
        queue.dequeue()
        XCTAssertTrue(queue.isEmpty())

        queue.dequeue()

    }
    
    func testQueueIsEmpty() {
        guard let queue = queue else {
            return
        }
        XCTAssertTrue(queue.isEmpty())
        XCTAssertEqual(queue.top, -1)
    }
    
    func testQueueSize() {
        guard let queue = queue else {
            return
        }
        XCTAssertTrue(queue.isEmpty())
        
        queue.enqueue(element: 5)
        queue.enqueue(element: 6)
        queue.enqueue(element: 7)
        queue.enqueue(element: 8)
        
        XCTAssertEqual(queue.size(), 4)
    }
    
    func testQueuePeek() {
        guard let queue = queue else {
            return
        }
        XCTAssertTrue(queue.isEmpty())
        
        queue.enqueue(element: 5)
        queue.enqueue(element: 6)
        XCTAssertEqual(queue.peek(), 6)
        queue.dequeue()
        queue.dequeue()
        XCTAssertNil(queue.peek())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
