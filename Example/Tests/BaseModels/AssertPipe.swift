//
//  AssertPipe.swift
//  PowerTools_Example
//
//  Created by Andrea Altea on 09/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class AssertPipe<Value>: PowerTools.Pipe<Value> {
    
    var successExpectation: XCTestExpectation?
    var failureExpectation: XCTestExpectation?
    var resetExpectation: XCTestExpectation?
    
    init(success: XCTestExpectation? = nil, failure: XCTestExpectation? = nil, reset: XCTestExpectation? = nil) {
        
        self.successExpectation = success
        self.failureExpectation = failure
        self.resetExpectation = reset
        super.init()
    }
    
    override func success(_ value: Value) throws {
        
        guard let exp = self.successExpectation else {
            XCTFail("success should not be called.")
            try super.success(value)
            return 
        }
        exp.fulfill()
        try super.success(value)
    }
    
    override func failure(_ error: Error) {
        
        defer { super.failure(error) }
        
        guard let exp = self.failureExpectation else {
           return XCTFail("failure should not be called.")
        }
        exp.fulfill()
    }
    
    override func reset() {
        
        defer { super.reset() }
        
        guard let exp = self.resetExpectation else {
            return XCTFail("reset should not be called.")
        }
        exp.fulfill()
    }
    
    var expectations: [XCTestExpectation] {
        
        var xpt: [XCTestExpectation] = []
        if let success = self.successExpectation {
            xpt.append(success)
        }
        if let failure = self.failureExpectation {
            xpt.append(failure)
        }
        if let reset = self.resetExpectation {
            xpt.append(reset)
        }
        return xpt
    }
}
