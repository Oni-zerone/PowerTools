//
//  ColorCollectionViewCell.swift
//  SOTViewModelRepresenter_Example
//
//  Created by Andrea Altea on 09/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import PowerTools

class ColorCollectionViewCell: UICollectionViewCell {   }

extension ColorCollectionViewCell {

    static let nibIdentifier = String(describing: ColorCollectionViewCell.self)

    struct Descriptor: ItemViewDescriptor, GridDescriptor {
        
        private let wide: Bool
        
        init(wide: Bool) {
            self.wide = wide
        }
        
        let reuseIdentifier: String = ColorCollectionViewCell.nibIdentifier
        
        let ratio: ViewRatio = ViewRatio(multiplier: 1.6)
        
        func size(in containerView: UIView, module: GridModule) -> CGSize {
            
            let baseSize = module.size(self.ratio)
            guard self.wide else {
                return baseSize
            }
            
            return wideSize(module, itemSize: baseSize)
        }
        
        private func wideSize(_ module: GridModule, itemSize: CGSize) -> CGSize {
            
            switch module.direction {
            case .vertical:
                return CGSize(width: module.maxSize, height: itemSize.height)
                
            case .horizontal:
                return CGSize(width: itemSize.width, height: module.maxSize)
            }
        }
    }
}

extension ColorCollectionViewCell: ColorView {

    func setup(color: UIColor) {
        self.backgroundColor = color
    }
}
