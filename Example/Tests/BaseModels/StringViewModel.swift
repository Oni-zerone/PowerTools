//
//  StringViewModel.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import PowerTools

struct StringDescriptor: ItemViewDescriptor {

    var reuseIdentifier: String
}

struct StringViewModel: ItemViewModel, Hashable {
    
    var descriptor: ItemViewDescriptor
    
    var string: String {
        return self.descriptor.reuseIdentifier
    }
    
    init(string: String) {
        self.descriptor = StringDescriptor(reuseIdentifier: string)
    }
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {
        
    }
    
    static func == (lhs: StringViewModel, rhs: StringViewModel) -> Bool {
        return lhs.string == rhs.string
    }
    
    var hashValue: Int {
        return self.string.hashValue
    }
}

extension String {
    
    var model: StringViewModel {
        return StringViewModel(string: self)
    }
}
