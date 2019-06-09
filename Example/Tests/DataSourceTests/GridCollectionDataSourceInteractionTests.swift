//
//  GridCollectionDataSourceInteractionTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class GridCollectionDataSourceInteractionTests: XCTestCase {

    var collection: UICollectionViewMock!
    var dataSource: GridCollectionDataSource!
    var interactionMock: InteractionDelegateMock!
    
    override func setUp() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        collection = UICollectionViewMock(frame: frame, collectionViewLayout: UICollectionViewLayout())
        dataSource = GridCollectionDataSource(view: collection, model: ["test"].model)
        interactionMock = InteractionDelegateMock()
        dataSource.interactionDelegate = interactionMock
    }

    override func tearDown() {
        dataSource = nil
        collection = nil
        interactionMock = nil
    }

    func testSetup() {
        XCTAssert(collection.dataSource as? GridCollectionDataSource ?== dataSource)
        XCTAssert(collection.delegate as? GridCollectionDataSource ?== dataSource)
    }
    
    func testShouldSelect() {
        interactionMock.containerViewShouldSelectClosure = { _, _ in return true }
        let result = collection.delegate?.collectionView?(collection,
                                             shouldSelectItemAt: IndexPath(item: 1, section: 0))
        XCTAssert(result ?== true)
        XCTAssert(interactionMock.containerViewShouldSelectCalled == true)
        XCTAssert(interactionMock.containerViewShouldSelectCallsCount == 1)
    }

    func testShouldSelectInvalidItem() {
        interactionMock.containerViewShouldSelectClosure = { _, _ in return true }
        let result = collection.delegate?.collectionView?(collection,
                                             shouldSelectItemAt: IndexPath(item: 0, section: 2))
        XCTAssert(result ?== false)
        XCTAssert(interactionMock.containerViewDidSelectCalled == false)
        XCTAssert(interactionMock.containerViewDidSelectCallsCount == 0)
    }
    
    func testDidSelect() {
        interactionMock.containerViewShouldSelectClosure = { _, _ in return true }
        collection.delegate?.collectionView?(collection,
                                                          didSelectItemAt: IndexPath(item: 1, section: 0))
        XCTAssert(interactionMock.containerViewDidSelectCalled == true)
        XCTAssert(interactionMock.containerViewDidSelectCallsCount == 1)
    }

    func testDidSelectInvalidItem() {
        interactionMock.containerViewShouldSelectClosure = { _, _ in return true }
        collection.delegate?.collectionView?(collection,
                                             didSelectItemAt: IndexPath(item: 0, section: 2))
        XCTAssert(interactionMock.containerViewDidSelectCalled == false)
        XCTAssert(interactionMock.containerViewDidSelectCallsCount == 0)
    }
    
    func testShouldDeselect() {
        interactionMock.containerViewShouldSelectClosure = { _, _ in return true }
        let result = collection.delegate?.collectionView?(collection,
                                                          shouldSelectItemAt: IndexPath(item: 1, section: 0))
        XCTAssert(result ?== true)
        XCTAssert(interactionMock.containerViewShouldSelectCalled == true)
        XCTAssert(interactionMock.containerViewShouldSelectCallsCount == 1)
    }
    
    func testShouldDeselectInvalidItem() {
        interactionMock.containerViewShouldDeselectClosure = { _, _ in return true }
        let result = collection.delegate?.collectionView?(collection,
                                                          shouldDeselectItemAt: IndexPath(item: 0, section: 2))
        XCTAssert(result ?== false)
        XCTAssert(interactionMock.containerViewDidDeselectCalled == false)
        XCTAssert(interactionMock.containerViewDidDeselectCallsCount == 0)
    }
    
    func testDidDeselect() {
        collection.delegate?.collectionView?(collection,
                                             didDeselectItemAt: IndexPath(item: 1, section: 0))
        XCTAssert(interactionMock.containerViewDidDeselectCalled == true)
        XCTAssert(interactionMock.containerViewDidDeselectCallsCount == 1)
    }
    
    func testDidDeselectInvalidItem() {
        collection.delegate?.collectionView?(collection,
                                             didDeselectItemAt: IndexPath(item: 0, section: 2))
        XCTAssert(interactionMock.containerViewDidDeselectCalled == false)
        XCTAssert(interactionMock.containerViewDidDeselectCallsCount == 0)
    }

    func testShouldHighlight() {
        interactionMock.containerViewShouldHighlightClosure = { _, _ in return true }
        let result = collection.delegate?.collectionView?(collection,
                                                          shouldHighlightItemAt: IndexPath(item: 1, section: 0))
        XCTAssert(result ?== true)
        XCTAssert(interactionMock.containerViewShouldHighlightCalled == true)
        XCTAssert(interactionMock.containerViewShouldHighlightCallsCount == 1)
    }
    
    func testShouldHighlightInvalidItem() {
        interactionMock.containerViewShouldHighlightClosure = { _, _ in return true }
        let result = collection.delegate?.collectionView?(collection,
                                                          shouldHighlightItemAt: IndexPath(item: 0, section: 2))
        XCTAssert(result ?== false)
        XCTAssert(interactionMock.containerViewShouldHighlightCalled == false)
        XCTAssert(interactionMock.containerViewShouldHighlightCallsCount == 0)
    }

    func testDidHighlight() {
        collection.delegate?.collectionView?(collection,
                                             didHighlightItemAt: IndexPath(item: 1, section: 0))
        XCTAssert(interactionMock.containerViewDidHighlightCalled == true)
        XCTAssert(interactionMock.containerViewDidHighlightCallsCount == 1)
    }
    
    func testDidHighlightInvalidItem() {
        collection.delegate?.collectionView?(collection,
                                             didHighlightItemAt: IndexPath(item: 0, section: 2))
        XCTAssert(interactionMock.containerViewDidHighlightCalled == false)
        XCTAssert(interactionMock.containerViewDidHighlightCallsCount == 0)
    }

    func testDidUnhighlight() {
        collection.delegate?.collectionView?(collection,
                                             didUnhighlightItemAt: IndexPath(item: 1, section: 0))
        XCTAssert(interactionMock.containerViewDidUnhighlightCalled == true)
        XCTAssert(interactionMock.containerViewDidUnhighlightCallsCount == 1)
    }
    
    func testDidUnhighlightInvalidItem() {
        collection.delegate?.collectionView?(collection,
                                             didUnhighlightItemAt: IndexPath(item: 0, section: 2))
        XCTAssert(interactionMock.containerViewDidUnhighlightCalled == false)
        XCTAssert(interactionMock.containerViewDidUnhighlightCallsCount == 0)
    }
}
