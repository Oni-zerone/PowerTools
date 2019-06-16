//
//  AssertPipe.swift
//  PowerTools_Example
//
//  Created by Andrea Altea on 09/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

public enum PipelineErrors: Error, Equatable {
    
    case requiredFailure
}

public class AssertPipe<Value>: PowerTools.Pipe<Value> {
    
    var successExpectation: XCTestExpectation?
    var failureExpectation: XCTestExpectation?
    var resetExpectation: XCTestExpectation?
    
    public init(success: XCTestExpectation? = nil, failure: XCTestExpectation? = nil, reset: XCTestExpectation? = nil) {
        
        self.successExpectation = success
        self.failureExpectation = failure
        self.resetExpectation = reset
        super.init()
    }
    
    public override func success(_ value: Value) {
        
        guard let exp = self.successExpectation else {
            XCTFail("success should not be called.")
            self.send(value)
            return
        }
        exp.fulfill()
        self.send(value)
    }
    
    public override func failure(_ error: Error) {
        
        defer { super.failure(error) }
        
        guard let exp = self.failureExpectation else {
            return XCTFail("failure should not be called.")
        }
        exp.fulfill()
    }
    
    public override func reset() {
        
        defer { super.reset() }
        
        guard let exp = self.resetExpectation else {
            return XCTFail("reset should not be called.")
        }
        exp.fulfill()
    }
    
    public var expectations: [XCTestExpectation] {
        
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
