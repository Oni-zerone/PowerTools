//
//  GridSectionTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 21/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

private struct GridSectionMock: GridSection {
    var header: ItemViewModel?
    
    var items: [ItemViewModel]
    
    var footer: ItemViewModel?
}

private struct ParametrizedGridSectionMock: GridSection {
    var header: ItemViewModel?
    
    var items: [ItemViewModel] = []
    
    var footer: ItemViewModel?
    
    var lineItems: Int?
    
    var referenceItemWidth: CGFloat = .greatestFiniteMagnitude
    
    var sectionInsets: UIEdgeInsets = .zero
    
    var sectionHorizontalItemSpacing: CGFloat = 0.0
    var sectionVerticalItemSpacing: CGFloat = 0.0

}

class GridSectionTests: XCTestCase {

    var collectionFrame: CGRect!
    var layout: UICollectionViewFlowLayout!
    var collection: UICollectionView!
    
    override func setUp() {
        
        collectionFrame = CGRect(origin: .zero, size: CGSize(width: 320, height: 500))
        layout = UICollectionViewFlowLayout()
        collection = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)
    }
    
    override func tearDown() {
        collection = nil
        layout = nil
        collectionFrame = nil
    }
    
    func testGridSectionDefaults() {
        let gridSection = GridSectionMock(header: nil, items: [], footer: nil)
        XCTAssert(gridSection.lineItems == nil)
        XCTAssert(gridSection.sectionInsets == .zero)
        XCTAssert(gridSection.sectionVerticalItemSpacing == 0.0)
        XCTAssert(gridSection.sectionHorizontalItemSpacing == 0.0)
        XCTAssert(gridSection.referenceItemWidth == .greatestFiniteMagnitude)
    }
    
    func testVerticalModuleForGridSection() {
        
        let gridSection = GridSectionMock(header: nil, items: [], footer: nil)
        let sectionModule = gridSection.module(for: collection)
        XCTAssert(sectionModule.direction == .vertical)
        XCTAssert(sectionModule.maxSize == collection.bounds.width)
        XCTAssert(sectionModule.referenceSize == collection.bounds.width)
        XCTAssert(sectionModule.size() == CGSize(width: collection.bounds.width,
                                                 height: collection.bounds.width))
    }

    func testMultipleColumnsVerticalModuleForGridSection() {
        
        var gridSection = ParametrizedGridSectionMock()
        gridSection.lineItems = 2
        
        let sectionModule = gridSection.module(for: collection)
        XCTAssert(sectionModule.direction == .vertical)
        XCTAssert(sectionModule.maxSize == collection.bounds.width)
        XCTAssert(sectionModule.referenceSize == collection.bounds.width / 2)
        XCTAssert(sectionModule.size() == CGSize(width: collection.bounds.width / 2,
                                                 height: collection.bounds.width / 2))

        gridSection.lineItems = 2
        gridSection.sectionHorizontalItemSpacing = 10.0
        gridSection.sectionVerticalItemSpacing = 0.0
        
        let twoLinesSectionModule = gridSection.module(for: collection)
        XCTAssert(twoLinesSectionModule.direction == .vertical)
        XCTAssert(twoLinesSectionModule.maxSize == collection.bounds.width)
        XCTAssert(twoLinesSectionModule.referenceSize == (collection.bounds.width - 10) / 2)
        XCTAssert(twoLinesSectionModule.size() == CGSize(width: (collection.bounds.width - 10) / 2,
                                                         height: (collection.bounds.width - 10) / 2))
    }

    func testHorizontalModuleForGridSection() {
        layout.scrollDirection = .horizontal
        
        let gridSection = GridSectionMock(header: nil, items: [], footer: nil)
        let sectionModule = gridSection.module(for: collection)
        XCTAssert(sectionModule.direction == .horizontal)
        XCTAssert(sectionModule.maxSize == collection.bounds.height)
        XCTAssert(sectionModule.referenceSize == collection.bounds.height)
        XCTAssert(sectionModule.size() == CGSize(width: collection.bounds.height,
                                                 height: collection.bounds.height))
    }
    
    func testMultipleColumnsHorizontalModuleForGridSection() {
        layout.scrollDirection = .horizontal
        
        var gridSection = ParametrizedGridSectionMock()
        gridSection.lineItems = 2
        
        let sectionModule = gridSection.module(for: collection)
        XCTAssert(sectionModule.direction == .horizontal)
        XCTAssert(sectionModule.maxSize == collection.bounds.height)
        XCTAssert(sectionModule.referenceSize == collection.bounds.height / 2)
        XCTAssert(sectionModule.size() == CGSize(width: collection.bounds.height / 2,
                                                 height: collection.bounds.height / 2))
        
        gridSection.lineItems = 2
        gridSection.sectionHorizontalItemSpacing = 0.0
        gridSection.sectionVerticalItemSpacing = 10.0
        
        let twoLinesSectionModule = gridSection.module(for: collection)
        XCTAssert(twoLinesSectionModule.direction == .horizontal)
        XCTAssert(twoLinesSectionModule.maxSize == collection.bounds.height)
        XCTAssert(twoLinesSectionModule.referenceSize == (collection.bounds.height - 10) / 2)
        XCTAssert(twoLinesSectionModule.size() == CGSize(width: (collection.bounds.height - 10) / 2,
                                                         height: (collection.bounds.height - 10) / 2))
    }
}
