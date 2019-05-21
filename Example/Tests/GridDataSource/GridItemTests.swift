//
//  GridItemTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 21/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PowerTools

fileprivate struct GridItemDescriptorMock: GridViewDescriptor {
    
    var reuseIdentifier: String
    
    var ratio: ViewRatio
}

fileprivate struct ItemDescriptorMock: ItemViewDescriptor {
    var reuseIdentifier: String
}

fileprivate struct GridItemMock: GridItemViewModel {
    
    var descriptor: ItemViewDescriptor
    
    var hashValue: Int
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) { }
}

class GridItemTests: XCTestCase {
    
    func testGridItemSize() {
        let descriptor = GridItemDescriptorMock(reuseIdentifier: "CellKey",
                                                ratio: ViewRatio(multiplier: 1.0, constant: 0))
        let gridItem = GridItemMock(descriptor: descriptor, hashValue: 001)
        XCTAssert(gridItem.reuseIdentifier == descriptor.reuseIdentifier)

        let referenceSize: CGFloat = 100.0
        let maxSize: CGFloat = 500.0
        let gridModule = GridModule(direction: .horizontal, referenceSize: referenceSize, maxSize: maxSize)
        let gridSize = gridModule.size(descriptor.ratio)
        
        XCTAssert(gridSize == gridItem.size(in: UIView(), module: gridModule))
    }
    
    func testGridItemSizeWithoutDescriptor() {
        let descriptor = ItemDescriptorMock(reuseIdentifier: "CellKey")
        let gridItem = GridItemMock(descriptor: descriptor, hashValue: 001)
        XCTAssert(gridItem.reuseIdentifier == descriptor.reuseIdentifier)
        
        let referenceSize: CGFloat = 100.0
        let maxSize: CGFloat = 500.0
        let gridModule = GridModule(direction: .horizontal, referenceSize: referenceSize, maxSize: maxSize)
        let gridModuleStandardSize = gridModule.size(.standard)
        
        XCTAssert(gridItem.size(in: UIView(), module: gridModule) == gridModuleStandardSize)
    }
}
