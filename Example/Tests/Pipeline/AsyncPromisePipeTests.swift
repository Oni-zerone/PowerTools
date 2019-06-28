//
//  AsyncPromisePipeTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 12/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools
import PowerToolsTester

class AsyncPromisePipeTests: XCTestCase {
    
    var pipeline: Pipeline<String>!
    
    override func setUp() {
        super.setUp()
        self.pipeline = Pipeline()
    }
    
    override func tearDown() {
        self.pipeline = nil
        super.tearDown()
    }
    
    func testPipelineMutation() {
        
        let originalString = "string"
        let mutatedString = "mutated"
        
        self.pipeline.asyncPromise(success: { (string, future) in
            XCTAssert(string == originalString)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                future(.success(mutatedString))
            }
        })
        
        self.pipeline.promise(success: { string in
            XCTAssert(string == mutatedString)
            return .success("")
        })
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load(originalString)
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testPipelineFailure() {
        
        self.pipeline.asyncPromise(success: { _, future in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                future(.failure(PipelineErrors.requiredFailure))
            }
        })
        
        self.pipeline.promise(failure: { error in
            
            XCTAssert((error as? PipelineErrors) == .requiredFailure)
            return .failure(error)
        })
        
        let failureExp = expectation(description: "failure")
        let assertPipe = AssertPipe<String>(failure: failureExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testEmptyPromisePipeSuccess() {
        
        self.pipeline.attach(AsyncPromisePipe())
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testEmptyPromisePipeFailure() {
        
        self.pipeline.promise(success: { _ in
            return .failure(PipelineErrors.requiredFailure)
        })
        self.pipeline.attach(AsyncPromisePipe())
        
        let failureExp = expectation(description: "failure")
        let assertPipe = AssertPipe<String>(failure: failureExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
    
    func testLazyOnSuccessAttach() {
        
        let promisePipe = AsyncPromisePipe<String>(success: { string, future in
            XCTFail("should not be called")
            future(.success(string))
        })
        
        let successExp = expectation(description: "success")
        promisePipe.onSuccess { string, future in
            successExp.fulfill()
            future(.success(string))
        }
        self.pipeline.attach(promisePipe)
        
        self.pipeline.load("")
        wait(for: [successExp], timeout: 1.0)
        
    }
    
    func testLazyOnFailureAttach() {
        
        self.pipeline.asyncPromise(success: { _, future in
            future(.failure(PipelineErrors.requiredFailure))
        })
        
        let promisePipe = AsyncPromisePipe<String>(failure: { error, future in
            XCTFail("should not be called")
            future(.failure(error))
        })
        
        let failureExp = expectation(description: "failure")
        promisePipe.onFailure { error, future in
            failureExp.fulfill()
            future(.failure(error))
        }
        
        self.pipeline.attach(promisePipe)
        self.pipeline.load("")
        wait(for: [failureExp], timeout: 1.0)
        
    }
}
