//
//  DataSourceUpdateTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import PowerTools

class DataSourceUpdateTests: XCTestCase {

    var collection: UICollectionView!
    var dataSource: CollectionBinderDataSource!
    
    override func setUp() {
        
        let model = ["first", "second", "third"].model
        self.collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 350, height: 1024),
                                           collectionViewLayout: UICollectionViewFlowLayout())
        self.collection.register(StringCell.self, forCellWithReuseIdentifier: "StringCell")
        self.dataSource = CollectionBinderDataSource(view: self.collection, model: model)
    }

    override func tearDown() {
        self.collection = nil
        self.dataSource = nil
    }

    func testSectionItemInsertionUpdate() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel[0].items.insert("l".model, at: 3)
        self.dataSource.update(model: mutatedModel)
    }
    
    func testMultipleSectionItemInsertionUpdate() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel[0].items.insert("l".model, at: 3)
        mutatedModel[1].items.insert("l".model, at: 1)
        mutatedModel[2].items.append("l".model)
        self.dataSource.update(model: mutatedModel)
    }

    func testSectionItemDeletionUpdate() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel[0].items.remove(at: 3)
        self.dataSource.update(model: mutatedModel)
    }

    func testMultipleSectionItemDeletionUpdate() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel[0].items.remove(at: 3)
        mutatedModel[1].items.remove(at: 0)
        mutatedModel[2].items.remove(at: 4)
        self.dataSource.update(model: mutatedModel)
    }

    func testManipulationsUpdate() {

        var mutatedModel = self.dataSource.model
        mutatedModel[0].items.remove(at: 0)
        mutatedModel[1].items.insert("f".model, at: 3)
        self.dataSource.update(model: mutatedModel)
    }
    
    func testSectionInsertion() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel.append("fourth".section)
        self.dataSource.update(model: mutatedModel)
    }

    func testSectionDeletion() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel.remove(at: 1)
        self.dataSource.update(model: mutatedModel)
    }
    
    func testHeaderInsertion() {

        var mutatedModel = self.dataSource.model
        mutatedModel[0].header = "h".model
        self.dataSource.update(model: mutatedModel)
    }
    
    func testFooterInsertion() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel[0].footer = "h".model
        self.dataSource.update(model: mutatedModel)
    }

    func testMultipleUpdates() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel[0].items.append("h".model)
        self.dataSource.update(model: mutatedModel)
        sleep(2)
        
        mutatedModel[1].items.remove(at: 2)
        self.dataSource.update(model: mutatedModel)
    }

    func testForceInsertion() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel[0].items.append("h".model)
        self.dataSource.update(model: mutatedModel, forceReload: true)
    }
    
    func testForceDeletion() {
        
        var mutatedModel = self.dataSource.model
        mutatedModel[0].items.remove(at: 2)
        self.dataSource.update(model: mutatedModel, forceReload: true)
    }

}
