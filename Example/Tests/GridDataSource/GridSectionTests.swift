//
//  GridSectionTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 21/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

struct GridSectionMock: GridSection {
    var header: ItemViewModel?
    
    var items: [ItemViewModel]
    
    var footer: ItemViewModel?
}

class GridSectionTests: XCTestCase {

    func testGridSectionDefaults() {
        let gridSection = GridSectionMock(header: nil, items: [], footer: nil)
        XCTAssert(gridSection.lineItems == nil)
        XCTAssert(gridSection.sectionInsets == .zero)
        XCTAssert(gridSection.sectionVerticalItemSpacing == 0.0)
        XCTAssert(gridSection.sectionHorizontalItemSpacing == 0.0)
    }
}
