//
//  GridModuleTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 13/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PowerTools

class GridModuleTests: XCTestCase {
    
    func testVerticalModuleStandardSize() {
        let module = GridModule(direction: .vertical, referenceSize: 100, maxSize: 300)
        let itemSize = module.size()
        XCTAssert(itemSize.width == module.referenceSize)
        XCTAssert(itemSize.height == module.referenceSize)
    }
    
    func testVerticalModuleSize() {
        let module = GridModule(direction: .vertical, referenceSize: 100, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 2.0, constant: 0.0))
        XCTAssert(itemSize.width == module.referenceSize)
        XCTAssert(itemSize.height == 200)
    }
    
    func testVerticalModuleSizeWithConstant() {
        let module = GridModule(direction: .vertical, referenceSize: 100, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 0.0, constant: 50.0))
        XCTAssert(itemSize.width == module.referenceSize)
        XCTAssert(itemSize.height == 50.0)
    }
    
    func testVerticalModuleSizeWithMultiplierAndConstant() {
        let module = GridModule(direction: .vertical, referenceSize: 100, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 2.0, constant: 50.0))
        XCTAssert(itemSize.width == module.referenceSize)
        XCTAssert(itemSize.height == 250.0)
    }
    
    func testVerticalModuleSizeWithMaxSize() {
        let module = GridModule(direction: .vertical, referenceSize: 100, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 10.0, constant: 0.0))
        XCTAssert(itemSize.width == module.referenceSize)
        XCTAssert(itemSize.height == 300.0)
    }
    
    func testHorizontalModuleStandardSize() {
        let module = GridModule(direction: .horizontal, referenceSize: 100, maxSize: 300)
        let itemSize = module.size()
        XCTAssert(itemSize.width == module.referenceSize)
        XCTAssert(itemSize.height == module.referenceSize)
    }
    
    func testHorizontalModuleSize() {
        let module = GridModule(direction: .horizontal, referenceSize: 200, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 2.0, constant: 0.0))
        XCTAssert(itemSize.height == module.referenceSize)
        XCTAssert(itemSize.width == 100)
    }
    
    func testHorizontalModuleSizeWithConstant() {
        let module = GridModule(direction: .horizontal, referenceSize: 50, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 0.0, constant: 50.0))
        XCTAssert(itemSize.height == module.referenceSize)
        XCTAssert(itemSize.width == 300.0)
    }
    
    func testHorizontalModuleSizeWithMultiplierAndConstant() {
        let module = GridModule(direction: .horizontal, referenceSize: 250.0, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 2.0, constant: 50.0))
        XCTAssert(itemSize.height == module.referenceSize)
        XCTAssert(itemSize.width == 100.0)
    }
    
    func testHorizontalModuleSizeWithMaxSize() {
        let module = GridModule(direction: .horizontal, referenceSize: 300, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 10.0, constant: 0.0))
        XCTAssert(itemSize.height == module.referenceSize)
        XCTAssert(itemSize.width == 100.0)
    }
}
