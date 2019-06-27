//
//  BinderDataSourcePipeTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 27/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools
import PowerToolsTester

struct UniqueSection: SectionViewModel, Equatable {
    
    var header: ItemViewModel?
    
    var items: [ItemViewModel] = []
    
    var footer: ItemViewModel?
    
    private var identifier = UUID()
    
    static func == (lhs: UniqueSection, rhs: UniqueSection) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

class BinderDataSourcePipeTests: XCTestCase {

    var dataSource: CollectionBinderDataSource!
    var pipeline: Pipeline<[SectionViewModel]>!
    
    override func setUp() {
        self.dataSource = CollectionBinderDataSource(view: nil, model: [])
        self.pipeline = Pipeline()
    }

    override func tearDown() {
        self.dataSource = nil
        self.pipeline = nil
    }

    func testAttach() {
        
        XCTAssert(self.dataSource.model.count == 0)
        self.pipeline.dataSource(self.dataSource)
        let newModel = [UniqueSection()]
        self.pipeline.load(newModel)
        tester.wait(0.5) {
            XCTAssert(self.dataSource.model as? [UniqueSection] ?== newModel)
        }
    }
    
    func testSuccess() {

        XCTAssert(self.dataSource.model.count == 0)
        let newModel = [UniqueSection()]
        let binderPipe = BinderPipe(dataSource: self.dataSource)
        binderPipe.success(newModel)
        tester.wait(0.5) {
            XCTAssert(self.dataSource.model as? [UniqueSection] ?== newModel)
        }
    }

    func testFailure() {

        let newModel = [UniqueSection()]
        self.dataSource.model = newModel
        XCTAssert(self.dataSource.model as? [UniqueSection] ?== newModel)
        let error = NSError(domain: "model.test", code: 0, userInfo: nil)
        let binderPipe = BinderPipe(dataSource: self.dataSource)
        binderPipe.failure(error)
        tester.wait(0.5) {
            XCTAssert(self.dataSource.model.count == 0)
        }
    }

    func testReset() {
        
        let newModel = [UniqueSection()]
        self.dataSource.model = newModel
        XCTAssert(self.dataSource.model as? [UniqueSection] ?== newModel)
        let binderPipe = BinderPipe(dataSource: self.dataSource)
        binderPipe.reset()
        tester.wait(0.5) {
            XCTAssert(self.dataSource.model.count == 0)
        }
    }
}
