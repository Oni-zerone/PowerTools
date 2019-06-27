//
//  CollectionViewControllerTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 27/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools
import PowerToolsTester

class CollectionViewControllerTests: XCTestCase {

    var controller: GridCollectionViewController!
    
    override func setUp() {
        self.controller = GridCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    }

    override func tearDown() {
        self.controller = nil
    }
    
    func testSetup() {
        let dataSource = GridCollectionDataSourceMock(view: nil, model: [])
        self.controller.dataSource = dataSource
        _ = self.controller.view
        XCTAssert(dataSource.view == self.controller.collectionView)
    }
    
    func testNibRegistration() {
        let collectionView = UICollectionViewMock(frame: .zero,
                                                  collectionViewLayout: UICollectionViewLayout())
        self.controller.collectionView = collectionView
        
        let nib = UINib(nibName: "ColorCollectionViewCell", bundle: .main)
        let nibIdentifier = "NibIdentifier"
        self.controller.register(nib, cellReuseIdentifier: nibIdentifier)
        
        XCTAssert(collectionView.registerNibForCellWithReuseIdentifierCallsCount == 1)
        let receivedArguments = collectionView.registerNibForCellWithReuseIdentifierReceivedArguments
        XCTAssert(receivedArguments?.nib ?== nib)
        XCTAssert(receivedArguments?.identifier == nibIdentifier)
    }
    
    func testRegistrationFromNibName() {
        let collectionView = UICollectionViewMock(frame: .zero,
                                                  collectionViewLayout: UICollectionViewLayout())
        self.controller.collectionView = collectionView
        
        let nibIdentifier = "ColorCollectionViewCell"
        self.controller.register(nibIdentifier, cellReuseIdentifier: nil)
        
        XCTAssert(collectionView.registerNibForCellWithReuseIdentifierCallsCount == 1)
        let receivedArguments = collectionView.registerNibForCellWithReuseIdentifierReceivedArguments
        XCTAssert(receivedArguments?.nib != nil)
        XCTAssert(receivedArguments?.identifier == nibIdentifier)
    }
    
    func testRegistrationFromNibNameCellIdentifier() {
        let collectionView = UICollectionViewMock(frame: .zero,
                                                  collectionViewLayout: UICollectionViewLayout())
        self.controller.collectionView = collectionView
        
        let nibIdentifier = "ColorCollectionViewCell"
        let cellIdentifier = "CellIdentifier"
        self.controller.register(nibIdentifier, cellReuseIdentifier: cellIdentifier)
        
        XCTAssert(collectionView.registerNibForCellWithReuseIdentifierCallsCount == 1)
        let receivedArguments = collectionView.registerNibForCellWithReuseIdentifierReceivedArguments
        XCTAssert(receivedArguments?.nib != nil)
        XCTAssert(receivedArguments?.identifier == cellIdentifier)
    }
    
    func testModelInjection() {
        let model = [UniqueSection()]
        self.controller.model = model
        XCTAssert(self.controller.model as? [UniqueSection] == model)
    }
    
    func testInderactionDelegateInjection() {
        let dataSource = GridCollectionDataSourceMock(view: nil, model: [])
        self.controller.dataSource = dataSource
        
        let interactionDelegate = InteractionDelegateMock()
        self.controller.interactionDelegate = interactionDelegate
        XCTAssert(dataSource.interactionDelegate as? InteractionDelegateMock ?== interactionDelegate)
        XCTAssert(self.controller.interactionDelegate as? InteractionDelegateMock ?== interactionDelegate)
    }
    
    func testScrollViewDelegateInjection() {
        let dataSource = GridCollectionDataSourceMock(view: nil, model: [])
        self.controller.dataSource = dataSource
        
        let scrollDelegate = ScrollViewDelegateMock()
        self.controller.scrollViewDelegate = scrollDelegate
        XCTAssert(dataSource.scrollViewDelegate as? ScrollViewDelegateMock ?== scrollDelegate)
        XCTAssert(self.controller.scrollViewDelegate as? ScrollViewDelegateMock ?== scrollDelegate)
    }
    
    func testModelUpdateInjection() {
        let dataSource = GridCollectionDataSourceMock(view: nil, model: [])
        self.controller.dataSource = dataSource
        
        let model = [UniqueSection()]
        self.controller.update(model: model)
        
        XCTAssert(dataSource.updateModelForceReloadCallsCount == 1)
        let arguments = dataSource.updateModelForceReloadReceivedArguments
        XCTAssert(arguments?.newModel as? [UniqueSection] ?== model)
        XCTAssert(arguments?.forceReload ?== self.controller.forceReload)
    }
}
