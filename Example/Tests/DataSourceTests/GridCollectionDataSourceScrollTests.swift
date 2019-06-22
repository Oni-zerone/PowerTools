//
//  GridCollectionDataSourceScrollTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 09/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools
import PowerToolsTester

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
    
    func testSetup() {
        XCTAssert(collection.dataSource as? GridCollectionDataSource ?== dataSource)
        XCTAssert(collection.delegate as? GridCollectionDataSource ?== dataSource)
    }

    func testScrollViewDidScroll() {
        collection.delegate?.scrollViewDidScroll?(collection)
        
        XCTAssert(scrollMock.scrollViewDidScrollCalled == true)
        XCTAssert(scrollMock.scrollViewDidScrollCallsCount == 1)
    }
    
    func testScrollViewDidZoom() {
        collection.delegate?.scrollViewDidZoom?(collection)
        
        XCTAssert(scrollMock.scrollViewDidZoomCalled == true)
        XCTAssert(scrollMock.scrollViewDidZoomCallsCount == 1)
    }
    
    func testScrollViewBeginDragging() {
        collection.delegate?.scrollViewWillBeginDragging?(collection)
        
        XCTAssert(scrollMock.scrollViewWillBeginDraggingCalled == true)
        XCTAssert(scrollMock.scrollViewWillBeginDraggingCallsCount == 1)
    }
    
    func testScrollViewEndDragging() {
        collection.delegate?.scrollViewDidScrollToTop?(collection)

        XCTAssert(scrollMock.scrollViewDidScrollToTopCalled == true)
        XCTAssert(scrollMock.scrollViewDidScrollToTopCallsCount == 1)
    }
    
    func testShouldScrollToTop() {
        scrollMock.scrollViewShouldScrollToTopClosure = { _ in return false }
        let result = collection.delegate?.scrollViewShouldScrollToTop?(collection)

        XCTAssert(result ?== false)
        XCTAssert(scrollMock.scrollViewShouldScrollToTopCalled == true)
        XCTAssert(scrollMock.scrollViewShouldScrollToTopCallsCount == 1)
    }

    func testShouldScrollToTopDefault() {
        dataSource.scrollViewDelegate = nil
        let result = collection.delegate?.scrollViewShouldScrollToTop?(collection)
        
        XCTAssert(result ?== true)
        XCTAssert(scrollMock.scrollViewShouldScrollToTopCalled == false)
        XCTAssert(scrollMock.scrollViewShouldScrollToTopCallsCount == 0)
    }

    func testDidScrollToTop() {
        collection.delegate?.scrollViewDidEndDragging?(collection, willDecelerate: true)
        
        XCTAssert(scrollMock.scrollViewDidEndDraggingWillDecelerateCalled == true)
        XCTAssert(scrollMock.scrollViewDidEndDraggingWillDecelerateCallsCount == 1)
    }
    
    func testDidEndDraggingWillDecelerate() {
        collection.delegate?.scrollViewDidEndDragging?(collection, willDecelerate: true)

        XCTAssert(scrollMock.scrollViewDidEndDraggingWillDecelerateCalled == true)
        XCTAssert(scrollMock.scrollViewDidEndDraggingWillDecelerateCallsCount == 1)
    }
    
    func testWillBeginDecelerating() {
        collection.delegate?.scrollViewWillBeginDecelerating?(collection)
        
        XCTAssert(scrollMock.scrollViewWillBeginDeceleratingCalled == true)
        XCTAssert(scrollMock.scrollViewWillBeginDeceleratingCallsCount == 1)
    }
    
    func testDidEndDecelerating() {
        collection.delegate?.scrollViewDidEndDecelerating?(collection)
        
        XCTAssert(scrollMock.scrollViewDidEndDeceleratingCalled == true)
        XCTAssert(scrollMock.scrollViewDidEndDeceleratingCallsCount == 1)
    }
    
    func testDidEndScrollingAnimation() {
        collection.delegate?.scrollViewDidEndScrollingAnimation?(collection)
        
        XCTAssert(scrollMock.scrollViewDidEndScrollingAnimationCalled == true)
        XCTAssert(scrollMock.scrollViewDidEndScrollingAnimationCallsCount == 1)
    }
    
    func testWillBeginZooming() {
        collection.delegate?.scrollViewWillBeginZooming?(collection, with: UIView())
        
        XCTAssert(scrollMock.scrollViewWillBeginZoomingWithCalled == true)
        XCTAssert(scrollMock.scrollViewWillBeginZoomingWithCallsCount == 1)
    }
    
    @available(iOS 11.0, *)
    func testAdjustedContentInset() {
        collection.delegate?.scrollViewDidChangeAdjustedContentInset?(collection)
        
        XCTAssert(scrollMock.scrollViewDidChangeAdjustedContentInsetCalled == true)
        XCTAssert(scrollMock.scrollViewDidChangeAdjustedContentInsetCallsCount == 1)
    }
    
    func testScrollViewWillEndDragging() {
        var contentOffset = CGPoint.zero
        collection.delegate?.scrollViewWillEndDragging?(collection,
                                                        withVelocity: .zero,
                                                        targetContentOffset: &contentOffset)
        
        XCTAssert(scrollMock.scrollViewWillEndDraggingWithVelocityTargetContentOffsetCalled == true)
        XCTAssert(scrollMock.scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount == 1)
    }
    
    func testDidEndZooming() {
        collection.delegate?.scrollViewDidEndZooming?(collection, with: UIView(), atScale: 1.0)

        XCTAssert(scrollMock.scrollViewDidEndZoomingWithAtScaleCalled == true)
        XCTAssert(scrollMock.scrollViewDidEndZoomingWithAtScaleCallsCount == 1)
    }
    
    func testViewForZooming() {
        let view = UIView()
        scrollMock.viewForZoomingInClosure = { _ in view }
        let result = collection.delegate?.viewForZooming?(in: collection)
        
        XCTAssert(result == view)
        XCTAssert(scrollMock.viewForZoomingInCalled == true)
        XCTAssert(scrollMock.viewForZoomingInCallsCount == 1)
    }
}
