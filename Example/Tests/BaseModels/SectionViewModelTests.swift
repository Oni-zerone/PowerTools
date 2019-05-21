//
//  SectionViewModelTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 21/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

private struct SectionViewModelMock: SectionViewModel {
    var header: ItemViewModel?
    
    var items: [ItemViewModel] = []
    
    var footer: ItemViewModel?
}

class SectionViewModelTests: XCTestCase {

    var section: SectionViewModel!
    
    override func setUp() {
        section = SectionViewModelMock()
    }

    override func tearDown() {
        section = nil
    }

    func testSectionHeaderFooterHelper() {
        let header = StringViewModel(string: "header")
        let footer = StringViewModel(string: "footer")
        section.header = header
        section.footer = footer
        
        XCTAssert(section.model(for: UICollectionView.elementKindSectionHeader) as? StringViewModel ?== header)
        XCTAssert(section.model(for: UICollectionView.elementKindSectionFooter) as? StringViewModel ?== footer)
    }
    
    func testSectionArrayItems() {
        let model: [SectionViewModel] = ["abc".section, "def".section, "ghi".section]
        XCTAssert((model.viewModel(at: IndexPath(item: 2, section: 0)) as? StringViewModel) ?== "c".model)
        XCTAssert((model.viewModel(at: IndexPath(item: 1, section: 0)) as? StringViewModel) ?== "b".model)
        XCTAssert((model.viewModel(at: IndexPath(item: 1, section: 2)) as? StringViewModel) ?== "h".model)
        XCTAssert((model.viewModel(at: IndexPath(item: 0, section: 1)) as? StringViewModel) ?== "d".model)
        XCTAssert((model.viewModel(at: IndexPath(item: 2, section: 2)) as? StringViewModel) ?== "i".model)
        XCTAssert((model.viewModel(at: IndexPath(item: 1, section: 1)) as? StringViewModel) ?== "e".model)
    }
    
    func testSectionArrayHeaderFooter() {
        let header = StringViewModel(string: "header")
        let footer = StringViewModel(string: "footer")
        section.header = header
        section.footer = footer
        
        XCTAssert([section].viewModel(ofKind: UICollectionView.elementKindSectionHeader,
                                      section: 0) as? StringViewModel ?== header)
        XCTAssert([section].viewModel(ofKind: UICollectionView.elementKindSectionHeader,
                                      section: 1) as? StringViewModel == nil)
        XCTAssert([section].viewModel(ofKind: UICollectionView.elementKindSectionFooter,
                                      section: 0) as? StringViewModel ?== footer)
        XCTAssert([section].viewModel(ofKind: UICollectionView.elementKindSectionFooter,
                                      section: 1) as? StringViewModel == nil)
    }
}
