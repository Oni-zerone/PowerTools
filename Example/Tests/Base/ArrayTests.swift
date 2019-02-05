//
//  ArrayTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 05/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

class ArrayTests: XCTestCase {

    func testFirstInsertion() {
        
        var base = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "L", "M", "N", "O"]
        let elements = ["1", "2", "3", "4", "5"]
        
        let expectedResult = ["1", "A", "B", "2", "C", "D", "3", "E", "F", "4", "G", "H", "5", "I", "L", "M", "N", "O"]
        
        let result = base.inserting(elements, offset: 0, frequency: 2)
        base.insert(elements, offset: 0, frequency: 2)

        XCTAssert(result == expectedResult)
        XCTAssert(base == expectedResult)
    }
    
    func testSecondInsertion() {
        
        var base = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "L", "M", "N", "O"]
        let elements = ["1", "2", "3", "4", "5"]
        
        let expectedResult = ["A", "B", "C", "1", "D", "2", "E", "3", "F", "4", "G", "5", "H", "I", "L", "M", "N", "O"]

        let result = base.inserting(elements, offset: 3, frequency: 1)
        base.insert(elements, offset: 3, frequency: 1)
        
        XCTAssert(result == expectedResult)
        XCTAssert(base == expectedResult)
    }
    
    func testThirdInsertion() {
        
        var base = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "L", "M", "N", "O"]
        let elements = ["1", "2", "3", "4", "5"]
        
        let expectedResult = ["1", "2", "3", "4", "5", "A", "B", "C", "D", "E", "F", "G", "H", "I", "L", "M", "N", "O"]
        
        let result = base.inserting(elements, offset: 0, frequency: 0)
        base.insert(elements, offset: 0, frequency: 0)
        
        XCTAssert(result == expectedResult)
        XCTAssert(base == expectedResult)
    }

    func testFourthInsertion() {
        
        var base = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "L", "M", "N", "O"]
        let elements = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
        
        let expectedResult = ["1", "A", "B", "2", "C", "D", "3", "E", "F", "4", "G", "H", "5", "I",
                              "L", "6", "M", "N", "7", "O", "8", "9", "10", "11", "12", "13", "14", "15"]
         
        let result = base.inserting(elements, offset: 0, frequency: 2)
        base.insert(elements, offset: 0, frequency: 2)
        
        XCTAssert(result == expectedResult)
        XCTAssert(base == expectedResult)
    }
}
