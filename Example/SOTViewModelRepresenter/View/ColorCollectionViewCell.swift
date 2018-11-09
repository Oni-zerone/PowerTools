//
//  ColorCollectionViewCell.swift
//  SOTViewModelRepresenter_Example
//
//  Created by Andrea Altea on 09/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SOTViewModelRepresenter

class ColorCollectionViewCell: UICollectionViewCell {
   
}

extension ColorCollectionViewCell {
    
    static let nibIdentifier = String(describing: ColorCollectionViewCell.self)
    
    struct Descriptor: ItemViewDescriptor {
        
        let reuseIdentifier: String = ColorCollectionViewCell.nibIdentifier
    }
}

extension ColorCollectionViewCell: ColorView {
    
    func setup(color: UIColor) {
        self.backgroundColor = color
    }
}
