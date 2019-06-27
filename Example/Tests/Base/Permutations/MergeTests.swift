//
//  MergeTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 27/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class MergeTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testInjectBefore() {
        let first = ["a", "b", "c"]
        let second = ["d", "e", "f"]
        let result = second.merge(contents: first, mode: .injectBefore)
        XCTAssert(result == ["a", "b", "c", "d", "e", "f"])
    }
    
    func testInjectAfter() {
        let first = ["a", "b", "c"]
        let second = ["d", "e", "f"]
        let result = first.merge(contents: second, mode: .injectAfter)
        XCTAssert(result == ["a", "b", "c", "d", "e", "f"])
    }
    
    func testInjectOffsetFrequency() {
        let first = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
        let second = ["A", "B", "C", "D"]
        let firstResult = first.merge(contents: second, mode: .inject(offset: 0, frequency: 0))
        XCTAssert(firstResult == ["A", "B", "C", "D", "a", "b", "c", "d", "e", "f", "g", "h", "i"])
        
        let secondResult = first.merge(contents: second, mode: .inject(offset: 1, frequency: 1))
        XCTAssert(secondResult == ["a", "A", "b", "B", "c", "C", "d", "D", "e", "f", "g", "h", "i"])

        let thirdResult = first.merge(contents: second, mode: .inject(offset: 0, frequency: 2))
        XCTAssert(thirdResult == ["A", "a", "b", "B", "c", "d", "C", "e", "f", "D", "g", "h", "i"])
        
        let fourthResult = first.merge(contents: second, mode: .inject(offset: 4, frequency: 2))
        XCTAssert(fourthResult == ["a", "b", "c", "d", "A", "e", "f", "B", "g", "h", "C", "i", "D"])
        
        let fifthResult = first.merge(contents: second, mode: .inject(offset: 6, frequency: 2))
        XCTAssert(fifthResult == ["a", "b", "c", "d", "e", "f", "A", "g", "h", "B", "i", "C", "D"])
    }
    
    func testInjectAtIndex() {
        let first = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
        let second = ["A", "B", "C", "D"]
        let firstResult = first.merge(contents: second, mode: .inject(at: 0))
        XCTAssert(firstResult == ["A", "B", "C", "D", "a", "b", "c", "d", "e", "f", "g", "h", "i"])
        
        let secondResult = first.merge(contents: second, mode: .inject(at: 4))
        XCTAssert(secondResult == ["a", "b", "c", "d", "A", "B", "C", "D", "e", "f", "g", "h", "i"])
        
        let thirdResult = first.merge(contents: second, mode: .inject(at: 6))
        XCTAssert(thirdResult == ["a", "b", "c", "d", "e", "f", "A", "B", "C", "D", "g", "h", "i"])
        
        let fourthResult = first.merge(contents: second, mode: .inject(at: 100))
        XCTAssert(fourthResult == ["a", "b", "c", "d", "e", "f", "g", "h", "i", "A", "B", "C", "D"])
    }
}
