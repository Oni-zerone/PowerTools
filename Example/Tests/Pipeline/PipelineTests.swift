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
        
        self.pipeline = Pipeline()
    }

    override func tearDown() {
        self.pipeline = nil
    }

    func testPipelineLoad() {
        
        let successExp = expectation(description: "success")
        let assertPipe = AssertPipe<String>(success: successExp)
        self.pipeline.attach(assertPipe)
        
        self.pipeline.load("")
        wait(for: assertPipe.expectations, timeout: 1.0)
    }
}
