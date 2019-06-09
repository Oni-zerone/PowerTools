//
//  GridCollectionDataSourceScrollTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 09/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class GridCollectionDataSourceScrollTests: XCTestCase {

    var collection: UICollectionViewMock!
    var dataSource: GridCollectionDataSource!
    var scrollMock: ScrollViewDelegateMock!
    
    override func setUp() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        collection = UICollectionViewMock(frame: frame, collectionViewLayout: UICollectionViewLayout())
        dataSource = GridCollectionDataSource(view: collection, model: ["test"].model)
        scrollMock = ScrollViewDelegateMock()
        dataSource.scrollViewDelegate = scrollMock
    }
    
    override func tearDown() {
        dataSource = nil
        collection = nil
        scrollMock = nil
    }
}
