//
//  PromisePipeTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 09/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class PromisePipeTests: XCTestCase {
    
    var pipeline: Pipeline<String>!
    
    override func setUp() {
        
        self.pipeline = Pipeline()
    }
    
    override func tearDown() {
        self.pipeline = nil
    }
    
    func testPipelineMutation() {
        
        let originalString = "string"
        let mutatedString = "mutated"
        
        self.pipeline.attach(PromisePipe(success: { string in
            XCTAssert(string == originalString )
            return mutatedString
        }))
        
        self.pipeline.attach(PromisePipe(success: { string in
            XCTAssert(string == mutatedString)
            return ""
        }))
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load(originalString)
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testPipelineFailure() {
        
        self.pipeline.attach(PromisePipe(success: { _ in
            throw PipelineErrors.requiredFailure
        }))
        
        self.pipeline.attach(PromisePipe(failure: { error in
            
            XCTAssert((error as? PipelineErrors) == .requiredFailure)
            return .failure(error)
        }))
        
        let failureExp = expectation(description: "failure")
        let assertPipe = AssertPipe<String>(failure: failureExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testMultipleAttacchedPipelines() {
        
        self.pipeline.attach(PromisePipe(success: { _ in
            throw PipelineErrors.requiredFailure
            
        }), PromisePipe(failure: { error in
            
            XCTAssert((error as? PipelineErrors) == .requiredFailure)
            return .failure(error)
        }))
        
        let failureExp = expectation(description: "failure")
        let assertPipe = AssertPipe<String>(failure: failureExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testEmptyPromisePipeSuccess() {
        
        self.pipeline.attach(PromisePipe())
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testEmptyPromisePipeFailure() {
        
        self.pipeline.attach(PromisePipe(success: { _ in
            throw PipelineErrors.requiredFailure

        }), PromisePipe())
        
        let failureExp = expectation(description: "failure")
        let assertPipe = AssertPipe<String>(failure: failureExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testLazyOnSuccessAttach() {
        
        let promisePipe = PromisePipe<String>(success: { string in
            XCTFail("should not be called")
            return string
        })

        let successExp = expectation(description: "success")
        promisePipe.onSuccess { string in
            successExp.fulfill()
            return string
        }
        self.pipeline.attach(promisePipe)
        
        self.pipeline.load("")
        wait(for: [successExp], timeout: 1.0)

    }
    
    func testLazyOnFailureAttach() {
        
        self.pipeline.attach(PromisePipe(success: { _ in throw PipelineErrors.requiredFailure }))
        
        let promisePipe = PromisePipe<String>(failure: { error in
            XCTFail("should not be called")
            return .failure(error)
        })
        
        let failureExp = expectation(description: "failure")
        promisePipe.onFailure { error in
            failureExp.fulfill()
            return .failure(error)
        }
        
        self.pipeline.attach(promisePipe)
        self.pipeline.load("")
        wait(for: [failureExp], timeout: 1.0)
        
    }

}