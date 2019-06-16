//
//  PipeTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 16/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PowerTools

class PipeTests: XCTestCase {
    
    var pipe: PowerTools.Pipe<String>!
    var assertPipe: AssertPipe<String>!
    
    override func setUp() {
        super.setUp()
        self.pipe = Pipe()
        self.assertPipe = AssertPipe()
        self.pipe.nextPipe = assertPipe
    }
    
    override func tearDown() {
        self.pipe = nil
        self.assertPipe = nil
        super.tearDown()
    }
    
    func testPipelineSucccess() {
        
        assertPipe.successExpectation = expectation(description: "success")
        self.pipe.process(.success(""))
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testPipelineReset() {

        assertPipe.resetExpectation = expectation(description: "reset")
        self.pipe.process(.reset)
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testPipelineFailure() {

        assertPipe.failureExpectation = expectation(description: "failure")
        self.pipe.process(.failure(PipelineErrors.requiredFailure))
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
}
