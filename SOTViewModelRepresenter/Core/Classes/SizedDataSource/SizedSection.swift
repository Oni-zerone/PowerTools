//
//  SizedSection.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public protocol SizedSection: SectionViewModel {
    
    var lineItems: Int? { get }
    
    var referenceItemWidth: CGFloat { get }
    
    var sectionInsets: UIEdgeInsets { get }
    
    var sectionInteritemSpacing: CGFloat { get }
    var sectionInterlineSpacing: CGFloat { get }
    
    var itemRatioMultiplier: CGFloat { get }
    var itemRatioConstant: CGFloat { get }
}

public extension SizedSection {
    
    var lineItems: Int? {
        return nil
    }
    
    var referenceItemWidth: CGFloat {
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
        
        let lineItems = CGFloat(self.lineItems ?? containerView.numberOfItems(self.referenceItemWidth))
        let sectionInsets =  self.sectionInsets.left + self.sectionInsets.right
        let perpendicular = (containerView.bounds.width - (self.sectionInteritemSpacing * (lineItems - 1)) - sectionInsets) / lineItems
        let parallel = perpendicular * self.itemRatioMultiplier + self.itemRatioConstant
        let maxWidth = containerView.bounds.width - sectionInsets
        return SizeModule(referenceDimension: perpendicular, derivedDimension: parallel, direction: containerView.direction, interitemSpacing: self.sectionInteritemSpacing, interlineSpacing: self.sectionInterlineSpacing, maxWidth: maxWidth)
    }
}

internal extension UIView {
    
    func numberOfItems(_ referenceItemWidth: CGFloat) -> Int {
        
        if referenceItemWidth == .greatestFiniteMagnitude {
            return 1
        }
        
        let containerWidth = self.direction == .vertical ? self.bounds.width : self.bounds.height
        let calculatedNumberOfItems = Int(floor(containerWidth / referenceItemWidth))
        return max(calculatedNumberOfItems, 1)
    }
    
    internal var direction: ContentDirection {
        
        guard let container = self as? DirectionableContainer else {
            return .vertical
        }
        return container.contentDirection
    }
}
