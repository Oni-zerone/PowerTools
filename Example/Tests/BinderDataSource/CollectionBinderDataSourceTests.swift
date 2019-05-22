//
//  CollectionDataSourceTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 22/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class CollectionBinderDataSourceTests: XCTestCase {

    var collection: UICollectionView!
    var dataSource: CollectionBinderDataSource!
    
    override func setUp() {
        collection = UICollectionView(frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 640)),
                                      collectionViewLayout: UICollectionViewLayout())
        dataSource = CollectionBinderDataSource(view: collection, model: [])
    }

    override func tearDown() {
        dataSource = nil
        collection = nil
    }

    func testDataSourceSetup() {
        XCTAssert(dataSource == collection.dataSource as? CollectionBinderDataSource)
        let newCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        dataSource.view = newCollection
        XCTAssert(dataSource == newCollection.dataSource as? CollectionBinderDataSource)
        XCTAssert(collection.dataSource == nil)
    }
}
