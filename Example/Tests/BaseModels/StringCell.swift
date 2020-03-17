//
//  StringCell.swift
//  PowerTools_Example
//
//  Created by Andrea Altea on 08/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import PowerTools

struct StringDescriptor: ItemViewDescriptor {

    var reuseIdentifier: String
}

class StringCell: UICollectionViewCell {
    var string: String?
}

extension StringCell: ItemView {
    
    static var descriptor: ItemViewDescriptor {
        return StringDescriptor(reuseIdentifier: String(describing: Self.self))
    }
    
    func setup(_ model: ItemViewModel, in containerView: UIView, at indexPath: IndexPath) {
        guard let model = model as? StringViewModel else {
            return
        }
        self.string = model.string
    }
}
