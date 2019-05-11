//
//  PipelineTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 09/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class PipelineTests: XCTestCase {

    var pipeline: Pipeline<String>!
    
    override func setUp() {
        super.setUp()
        self.pipeline = Pipeline()
    }

    override func tearDown() {
        self.pipeline = nil
        super.tearDown()
    }

    func testPipelineLoad() {
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testPipelineReset() {
        
        let resetExp = expectation(description: "reset")
        let assertPipe = AssertPipe<String>(reset: resetExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.reset()
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testPipelineFailure() {
        
        self.pipeline.attach(PromisePipe(success: { _ in
            return .failure(PipelineErrors.requiredFailure)
        }))

        let failureExp = expectation(description: "failure")
        let assertPipe = AssertPipe<String>(failure: failureExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testHeadPipe() {
        
        self.pipeline.attach(PromisePipe(success: { value in
            XCTAssert(value == "HeadPipe")
            return .success(value)
        }))
        self.pipeline.headPipe = PromisePipe(success: { _ in
            return .success("HeadPipe")
        })
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testHeadPipeInit() {
        
        self.pipeline = Pipeline(headPipe: PromisePipe(success: { value in
            XCTAssert(value == "HeadPipe")
            return .success(value)
        }))
        self.pipeline.headPipe = PromisePipe(success: { _ in
            return .success("HeadPipe")
        })
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }

    func testTailPipe() {
        
        let successExp = expectation(description: "success")
        self.pipeline.tailPipe = AssertPipe(success: successExp)
        self.pipeline.load("")
        wait(for: [successExp], timeout: 1.0)
    }

    func testTailPipeContent() {
        
        let successExp = expectation(description: "success")
        self.pipeline.tailPipe = PromisePipe(success: { value in
            XCTAssert(value == "Content")
            successExp.fulfill()
            return nil
        })

        self.pipeline.attach(PromisePipe(success: { _ in
            return .success("Content")
        }))
        self.pipeline.load("")
        wait(for: [successExp], timeout: 1.0)
    }

    func testTailPipeInit() {

        self.pipeline = Pipeline(headPipe: PromisePipe(success: { value in
            XCTAssert(value == "HeadPipe")
            return .success(value)
        }))
        self.pipeline.headPipe = PromisePipe(success: { _ in
            return .success("HeadPipe")
        })

        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
}
