//
//  StringViewModel.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import PowerTools

struct StringViewModel: ItemViewModel, Hashable {
    
    var descriptor: ItemViewDescriptor
    
    var string: String
    
    init(string: String, descriptor: ItemViewDescriptor = StringCell.descriptor) {
        self.descriptor = descriptor
        self.string = string
    }
    
    static func == (lhs: StringViewModel, rhs: StringViewModel) -> Bool {
        return lhs.string == rhs.string
    }

    func hash(into hasher: inout Hasher) {
        return self.string.hash(into: &hasher)
    }
}

extension String {
    
    var model: StringViewModel {
        return StringViewModel(string: self)
    }
}
