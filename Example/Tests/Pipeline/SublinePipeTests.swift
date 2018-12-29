//
//  SublinePipe.swift
//  PowerTools_Example
//
//  Created by Andrea Altea on 27/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class SublinePipeTests: XCTestCase {
    
    var pipeline: Pipeline<[String]>!
    
    override func setUp() {
        super.setUp()
        
        self.pipeline = Pipeline()
    }
    
    override func tearDown() {
        
        self.pipeline = nil
        super.tearDown()
    }
    
    func testSublineResult() {
        
        let firstString = "string"
        let secondString = "sub_first"
        let thirdString = "sub_second"
        
        self.pipeline.attach(PromisePipe<[String]>(success: { _ in
            return [firstString]
        }))
        
        let subline = SublinePipe<String>(merge: .injectAfter)
        subline.attach(PromisePipe<[String]>(success: { _ in
            return [secondString]
        }), PromisePipe<[String]>(success: { strings in
            return strings.appending(thirdString)
        }))
        self.pipeline.attach(subline)
        
        self.pipeline.attach(PromisePipe(success: { strings in
            XCTAssert(strings.count == 3)
            XCTAssert(strings.first == firstString)
            XCTAssert(strings[1] == secondString)
            XCTAssert(strings.last == thirdString)
            return strings
        }))
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<[String]>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load([])
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testSublineFailure() {
    
        let firstString = "string"
        
        self.pipeline.attach(PromisePipe<[String]>(success: { _ in
            return [firstString]
        }))
        
        let subline = SublinePipe<String>(merge: .injectAfter)
        subline.attach(PromisePipe<[String]>(success: { _ in
            throw PipelineErrors.requiredFailure
        }))
        self.pipeline.attach(subline)
        
        self.pipeline.attach(PromisePipe(success: { strings in
            XCTAssert(strings.count == 1)
            XCTAssert(strings.first == firstString)
            return strings
        }))
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<[String]>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load([])
        wait(for: assertPipe.expectations, timeout: 1.0)

    }
    
    func testPassthroughtSublineResult() {
        
        let firstString = "string"
        let secondString = "mutated"
        var count = 0
        
        self.pipeline.attach(PromisePipe<[String]>(success: { _ in
            return [firstString]
        }))
        
        let subline = SublinePipe<String>(merge: .injectAfter)
        subline.shouldPassThrought = true
        subline.attach(PromisePipe<[String]>(success: { _ in
            return [secondString]
        }))
        self.pipeline.attach(subline)
        
        self.pipeline.attach(PromisePipe(success: { strings in
            
            switch count {
            case 0:
                XCTAssert(strings.count == 1)
                XCTAssert(strings.first == firstString)
                
            case 1:
                XCTAssert(strings.count == 2)
                XCTAssert(strings.first == firstString)
                XCTAssert(strings.last == secondString)
                
            default:
                XCTFail("Unexpected")
            }
            
            count += 1
            return strings
        }))
        
        let successExp = expectation(description: "success")
        successExp.expectedFulfillmentCount = 2
        let assertPipe = AssertPipe<[String]>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load([])
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
}
