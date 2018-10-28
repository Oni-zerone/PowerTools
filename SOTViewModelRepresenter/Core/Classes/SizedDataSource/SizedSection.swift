//
//  SizedSection.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public protocol SizedSection {
    
    var numberOfColumns: Int? { get }
    
    var columnReferenceWidth: CGFloat { get }
    
    var sectionInsets: UIEdgeInsets { get }
    
    var sectionInteritemSpacing: CGFloat { get }
    var sectionInterlineSpacing: CGFloat { get }
    
    var itemRatioMultiplier: CGFloat { get }
    var itemRatioConstant: CGFloat { get }
}

public extension SizedSection {
    
    var numberOfColumns: Int? {
        return nil
    }
    
    var columnReferenceWidth: CGFloat {
        return .greatestFiniteMagnitude
    }
    
    var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    var sectionInteritemSpacing: CGFloat {
        return 0
    }
    
    var sectionInterlineSpacing: CGFloat {
        return 0
    }
    
    var itemRatioMultiplier: CGFloat {
        return 1
    }
    
    var itemRatioConstant: CGFloat {
        return 0
    }
    
    func module(for containerView: UIView) -> SizeModule {
        
            let numberOfColumns = CGFloat(self.numberOfColumns ?? containerView.numberOfColumns(columnReferenceWidth))
            let sectionInsets = self.sectionInsets.left + self.sectionInsets.right
            let cellWidth = (containerView.bounds.width - (self.sectionInteritemSpacing * (numberOfColumns - 1)) - sectionInsets) / numberOfColumns
            let maxWidth = containerView.bounds.width - sectionInsets
            return SizeModule(cellWidth, interitemSpacing: self.sectionInteritemSpacing, interlineSpacing: self.sectionInterlineSpacing, multiplier: self.itemRatioMultiplier, constant: self.itemRatioConstant, maxWidth: maxWidth)
    }
}

internal extension UIView {
        
        func numberOfColumns(_ columnReferenceWidth: CGFloat) -> Int {
            
            if columnReferenceWidth == .greatestFiniteMagnitude {
                return 1
            }
            let calculatedNumberOfColumns = Int(floor(self.bounds.width / columnReferenceWidth))
            return max(calculatedNumberOfColumns, 1)
        }
}
