//
//  GridModuleTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 20/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PowerTools

class GridModuleTests: XCTestCase {

    func testVerticalGridModule() {
        let referenceSize: CGFloat = 100.0
        let maxSize: CGFloat = 500.0
        let gridModule = GridModule(direction: .vertical, referenceSize: referenceSize, maxSize: maxSize)
        
        let firstPureMultiplierSize = gridModule.size(ViewRatio(multiplier: 1.0, constant: 0.0))
        XCTAssert(firstPureMultiplierSize.width == referenceSize)
        XCTAssert(firstPureMultiplierSize.height == referenceSize)
        
        let secondPureMultiplierSize = gridModule.size(ViewRatio(multiplier: 2.0, constant: 0.0))
        XCTAssert(secondPureMultiplierSize.width == referenceSize)
        XCTAssert(secondPureMultiplierSize.height == 2.0 * referenceSize)
        
        let thirdPureMultiplierSize = gridModule.size(ViewRatio(multiplier: 5.0, constant: 0.0))
        XCTAssert(thirdPureMultiplierSize.width == referenceSize)
        XCTAssert(thirdPureMultiplierSize.height == 5.0 * referenceSize)

        let fourthPureMultiplierSize = gridModule.size(ViewRatio(multiplier: 0.5, constant: 0.0))
        XCTAssert(fourthPureMultiplierSize.width == referenceSize)
        XCTAssert(fourthPureMultiplierSize.height == referenceSize / 2)

        let fifthPureMultiplierSize = gridModule.size(ViewRatio(multiplier: -2.0, constant: 0.0))
        XCTAssert(fifthPureMultiplierSize.width == referenceSize)
        XCTAssert(fifthPureMultiplierSize.height == 2.0 * referenceSize)

        let firstPureConstant: CGFloat = 50
        let firstPureContantSize = gridModule.size(ViewRatio(multiplier: 0.0, constant: firstPureConstant))
        XCTAssert(firstPureContantSize.width == referenceSize)
        XCTAssert(firstPureContantSize.height == firstPureConstant)

        let secondPureConstant: CGFloat = -50
        let secondPureContantSize = gridModule.size(ViewRatio(multiplier: 0.0, constant: secondPureConstant))
        XCTAssert(secondPureContantSize.width == referenceSize)
        XCTAssert(secondPureContantSize.height == -1 * secondPureConstant)
        
        let firstConstant: CGFloat = 50
        let firstComplexSize = gridModule.size(ViewRatio(multiplier: 1.0, constant: firstConstant))
        XCTAssert(firstComplexSize.width == referenceSize)
        XCTAssert(firstComplexSize.height == referenceSize + firstConstant)
        
        let secondConstant: CGFloat = 100
        let secondComplexSize = gridModule.size(ViewRatio(multiplier: 3.0, constant: secondConstant))
        XCTAssert(secondComplexSize.width == referenceSize)
        XCTAssert(secondComplexSize.height == (3.0 * referenceSize) + secondConstant)
        
        let thirdConstant: CGFloat = -100
        let thirdComplexSize = gridModule.size(ViewRatio(multiplier: 2.0, constant: thirdConstant))
        XCTAssert(thirdComplexSize.width == referenceSize)
        XCTAssert(thirdComplexSize.height == referenceSize)
    }
    
    func testHorizontalGridModule() {
        let referenceSize: CGFloat = 100.0
        let maxSize: CGFloat = 500.0
        let gridModule = GridModule(direction: .horizontal, referenceSize: referenceSize, maxSize: maxSize)
        
        let firstPureMultiplierSize = gridModule.size(ViewRatio(multiplier: 1.0, constant: 0.0))
        XCTAssert(firstPureMultiplierSize.width == referenceSize)
        XCTAssert(firstPureMultiplierSize.height == referenceSize)
        
        let secondPureMultiplierSize = gridModule.size(ViewRatio(multiplier: 2.0, constant: 0.0))
        XCTAssert(secondPureMultiplierSize.width == referenceSize / 2.0)
        XCTAssert(secondPureMultiplierSize.height == referenceSize)
        
        let thirdPureMultiplierSize = gridModule.size(ViewRatio(multiplier: 5.0, constant: 0.0))
        XCTAssert(thirdPureMultiplierSize.width == referenceSize / 5.0)
        XCTAssert(thirdPureMultiplierSize.height == referenceSize)
        
        let fourthPureMultiplierSize = gridModule.size(ViewRatio(multiplier: 0.5, constant: 0.0))
        XCTAssert(fourthPureMultiplierSize.width == 2.0 * referenceSize)
        XCTAssert(fourthPureMultiplierSize.height == referenceSize)
        
        let fifthPureMultiplierSize = gridModule.size(ViewRatio(multiplier: -2.0, constant: 0.0))
        XCTAssert(fifthPureMultiplierSize.width == referenceSize / 2.0)
        XCTAssert(fifthPureMultiplierSize.height == referenceSize)
        
        let firstPureConstant: CGFloat = 50
        let firstPureContantSize = gridModule.size(ViewRatio(multiplier: 0.0, constant: firstPureConstant))
        XCTAssert(firstPureContantSize.width == firstPureConstant)
        XCTAssert(firstPureContantSize.height == referenceSize)
        
        let secondPureConstant: CGFloat = -50
        let secondPureContantSize = gridModule.size(ViewRatio(multiplier: 0.0, constant: secondPureConstant))
        XCTAssert(secondPureContantSize.width == -1 * secondPureConstant)
        XCTAssert(secondPureContantSize.height == referenceSize)
        
        let firstConstant: CGFloat = 50
        let firstComplexSize = gridModule.size(ViewRatio(multiplier: 1.0, constant: firstConstant))
        XCTAssert(firstComplexSize.width == referenceSize - firstConstant)
        XCTAssert(firstComplexSize.height == referenceSize)
        
        let secondConstant: CGFloat = 100
        let secondComplexSize = gridModule.size(ViewRatio(multiplier: 3.0, constant: secondConstant))
        XCTAssert(secondComplexSize.width == (referenceSize - secondConstant) / 3.0)
        XCTAssert(secondComplexSize.height == referenceSize)
        
        let thirdConstant: CGFloat = -100
        let thirdComplexSize = gridModule.size(ViewRatio(multiplier: 2.0, constant: thirdConstant))
        XCTAssert(thirdComplexSize.width == (referenceSize - thirdConstant) / 2.0)
        XCTAssert(thirdComplexSize.height == referenceSize)
    }
    
    func testViewRatioStandardSize() {
        let standardViewRatio = ViewRatio.standard
        XCTAssert(standardViewRatio.constant == 0.0)
        XCTAssert(standardViewRatio.multiplier == 1.0)
    }
    
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
    
    func testHorizontalModuleSizeWithMultiplierAndConstant() {
        let module = GridModule(direction: .horizontal, referenceSize: 250.0, maxSize: 300)
        let itemSize = module.size(ViewRatio(multiplier: 2.0, constant: 50.0))
        XCTAssert(itemSize.height == module.referenceSize)
        XCTAssert(itemSize.width == 100.0)
    }
}
