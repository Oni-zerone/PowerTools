//
//  ItemViewModelMock.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 22/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import PowerTools

struct ViewModelMock: ItemViewModel {
    
    var descriptor: ItemViewDescriptor
    var hashValue: Int
    var setupMock: (_ view: UIView, _ containerView: UIView, _ indexPath: IndexPath) -> Void
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {
        setupMock(view, containerView, indexPath)
    }
}
