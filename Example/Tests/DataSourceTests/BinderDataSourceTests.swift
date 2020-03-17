//
//  BinderDataSourceTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class CollectionBinderDataSourceTests: XCTestCase {
    
    let header = UICollectionView.elementKindSectionHeader
    let footer = UICollectionView.elementKindSectionFooter
    
    var collection: UICollectionViewMock!
    var dataSource: CollectionBinderDataSource!
    
    override func setUp() {
        
        let collectionFrame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        self.collection = UICollectionViewMock(frame: collectionFrame, collectionViewLayout: UICollectionViewLayout())
        self.collection.cell = StringCell()
        self.collection.supplementaryViews[header] = StringCell()
        self.collection.supplementaryViews[footer] = StringCell()

        self.dataSource = CollectionBinderDataSource(view: collection, model: [])
    }
    
    override func tearDown() {
        self.dataSource = nil
        self.collection = nil
    }
    
    func testDataSourceSetup() {
        XCTAssert(dataSource == collection.dataSource as? CollectionBinderDataSource)
        let newCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        dataSource.view = newCollection
        XCTAssert(dataSource == newCollection.dataSource as? CollectionBinderDataSource)
        XCTAssert(collection.dataSource == nil)
    }

    func testReload() {
        XCTAssert(collection.dataSource?.numberOfSections?(in: collection) ?== 0)
        XCTAssert(collection.dataSource?.collectionView(collection, numberOfItemsInSection: 0) ?== 0)
        
        var sections = ["first", "second", "foo"].model
        var firstSection = sections[0]
        firstSection.header = StringViewModel(string: "Header",
                                              descriptor: GenericItemViewDescriptor(reuseIdentifier: header))
        sections[0] = firstSection
        
        var lastSection = sections[2]
        lastSection.footer = StringViewModel(string: "Footer",
                                             descriptor: GenericItemViewDescriptor(reuseIdentifier: header))
        sections[2] = lastSection
        dataSource.update(model: sections, forceReload: true)
        
        XCTAssert(collection.dataSource?.numberOfSections?(in: collection) ?== 3)
        XCTAssert(collection.dataSource?.collectionView(collection, numberOfItemsInSection: 0) ?== 5)
        XCTAssert(collection.dataSource?.collectionView(collection, numberOfItemsInSection: 1) ?== 6)
        XCTAssert(collection.dataSource?.collectionView(collection, numberOfItemsInSection: 2) ?== 3)
        XCTAssert(collection.dataSource?.collectionView(collection, numberOfItemsInSection: 3) ?== 0)
        
        checkHeader(section: 0)
        checkCell(for: IndexPath(item: 0, section: 0))
        checkCell(for: IndexPath(item: 1, section: 0))
        checkCell(for: IndexPath(item: 2, section: 0))
        checkCell(for: IndexPath(item: 3, section: 0))
        checkCell(for: IndexPath(item: 4, section: 0))
        checkEmptyFooter(section: 0)
        
        checkEmptyHeader(section: 1)
        checkCell(for: IndexPath(item: 0, section: 1))
        checkCell(for: IndexPath(item: 1, section: 1))
        checkCell(for: IndexPath(item: 2, section: 1))
        checkCell(for: IndexPath(item: 3, section: 1))
        checkCell(for: IndexPath(item: 4, section: 1))
        checkCell(for: IndexPath(item: 5, section: 1))
        checkEmptyFooter(section: 1)
        
        checkEmptyHeader(section: 2)
        checkCell(for: IndexPath(item: 0, section: 2))
        checkCell(for: IndexPath(item: 1, section: 2))
        checkCell(for: IndexPath(item: 2, section: 2))
        checkFooter(section: 2)
    }
    
    func checkHeader(section: Int) {
        let indexPath = IndexPath(item: 0, section: section)
        guard let cell = dataSource.collectionView(collection,
                                                   viewForSupplementaryElementOfKind: header,
                                                   at: indexPath) as? StringCell,
            let itemModel = dataSource.model.viewModel(ofKind: header, section: section) as? StringViewModel else {
                XCTFail("Invalid objects")
                return
        }
        XCTAssert(cell.string == itemModel.string)
    }
    
    func checkEmptyHeader(section: Int) {
        let indexPath = IndexPath(item: 0, section: section)
        if dataSource.collectionView(collection,
                                     viewForSupplementaryElementOfKind: header,
                                     at: indexPath) as? StringCell != nil {
            XCTFail("Invalid objects")
        }
    }
    
    func checkCell(for indexPath: IndexPath) {
        guard let cell = collection.dataSource?.collectionView(collection, cellForItemAt: indexPath) as? StringCell,
            let itemModel = dataSource.model.viewModel(at: indexPath) as? StringViewModel else {
                XCTFail("Invalid objects")
                return
        }
        XCTAssert(cell.string == itemModel.string)
    }
    
    func checkFooter(section: Int) {
        let indexPath = IndexPath(item: 0, section: section)
        guard let cell = dataSource.collectionView(collection,
                                                   viewForSupplementaryElementOfKind: footer,
                                                   at: indexPath) as? StringCell,
            let itemModel = dataSource.model.viewModel(ofKind: footer, section: section) as? StringViewModel else {
                XCTFail("Invalid objects")
                return
        }
        XCTAssert(cell.string == itemModel.string)
    }
    
    func checkEmptyFooter(section: Int) {
        let indexPath = IndexPath(item: 0, section: section)
        if dataSource.collectionView(collection,
                                     viewForSupplementaryElementOfKind: footer,
                                     at: indexPath) as? StringCell != nil {
            XCTFail("Invalid objects")
        }
    }
}
