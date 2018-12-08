//
//  ModelUpdateTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import PowerTools

class ModelUpdateTests: XCTestCase {

    var baseModel: [StringSectionViewModel]!
    
    override func setUp() {
        self.baseModel = ["abc".sectionVM]
    }

    override func tearDown() {
        self.baseModel = nil
    }

    func testModelInsertion() {
        guard var mutatedModel = self.baseModel else {
            return XCTFail("Invalid model")
        }
        mutatedModel[0].items.append("d".vm)
        
        let changes = ModelUpdate(from: self.baseModel, to: mutatedModel)
        XCTAssert(changes.model as? [StringSectionViewModel] == mutatedModel)
        XCTAssert(changes.change?.count == 1)
        XCTAssert(changes.change!.first!.isInsert(IndexPath(item: 3, section: 0)))
    }
    
    func testModelDeletion() {
        guard var mutatedModel = self.baseModel else {
            return XCTFail("Invalid model")
        }
        mutatedModel[0].items.remove(at: 2)
        
        let changes = ModelUpdate(from: self.baseModel, to: mutatedModel)
        XCTAssert(changes.model as? [StringSectionViewModel] == mutatedModel)
        XCTAssert(changes.change?.count == 1)
        XCTAssert(changes.change!.first!.isDelete(IndexPath(item: 2, section: 0)))
    }

    func testModelReplacement() {
        guard var mutatedModel = self.baseModel else {
            return XCTFail("Invalid model")
        }
        mutatedModel[0].items[1] = "d".vm
        
        let changes = ModelUpdate(from: self.baseModel, to: mutatedModel)
        XCTAssert(changes.model as? [StringSectionViewModel] == mutatedModel)
        XCTAssert(changes.change?.count == 2)
        let indexPath = IndexPath(item: 1, section: 0)
        XCTAssert(changes.change!.contains(where: { $0.isInsert(indexPath) }))
        XCTAssert(changes.change!.contains(where: { $0.isDelete(indexPath) }))
    }
}
