//
//  GridSection.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public protocol GridSection: SectionViewModel {
    
    var lineItems: Int? { get }
    
    var referenceItemWidth: CGFloat { get }
    
    var sectionInsets: UIEdgeInsets { get }
    
    var sectionInteritemSpacing: CGFloat { get }
    var sectionInterlineSpacing: CGFloat { get }
    
    var itemRatioMultiplier: CGFloat { get }
    var itemRatioConstant: CGFloat { get }
}

public extension GridSection {
    
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
    
    func module(for containerView: UIView) -> GridModule {
        
        let sizing = self.referenceSizing(containerView.direction, container: containerView)
        return GridModule(referenceSize: sizing.size,
                          interitemSpacing: self.sectionInteritemSpacing,
                          interlineSpacing: self.sectionInterlineSpacing,
                          maxWidth: sizing.maxReference)
    }
    
    internal func referenceSizing(_ direction: ContentDirection, container: UIView) -> (size: CGSize, maxReference: CGFloat) {
        
        let lineItems = CGFloat(self.lineItems ?? container.numberOfItems(self.referenceItemWidth))
        let parallelInsets = self.sectionInsets.parallelInsets(for: direction)
        let maxReference = container.bounds.size.referenceLenght(for: direction) - parallelInsets
        let interItemsSpace = max(0, self.sectionInteritemSpacing * (lineItems - 1))
        let reference = floor((maxReference - interItemsSpace) / lineItems)
        let derived = reference * self.itemRatioMultiplier + self.itemRatioConstant
        let referenceSize = CGSize.prepare(direction, referenceDimension: reference, derivedDimension: derived)
        return (size: referenceSize, maxReference: maxReference)
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

internal extension UIEdgeInsets {
    
    func parallelInsets(for direction: ContentDirection) -> CGFloat {
        
        switch direction {
        case .vertical:
            return self.left + self.right
        case .horizontal:
            return self.top + self.right
        }
    }
}

internal extension CGSize {
    
    static func prepare(_ direction: ContentDirection, referenceDimension: CGFloat, derivedDimension: CGFloat) -> CGSize {
        
        switch direction {
            
        case .vertical:
            return CGSize(width: referenceDimension, height: derivedDimension)
        case .horizontal:
            return CGSize(width: derivedDimension, height: referenceDimension)
        }
    }
    
    func referenceLenght(for direction: ContentDirection) -> CGFloat {
        
        switch direction {
            
        case .vertical:
            return self.width
            
        case .horizontal:
            return self.height
        }
    }
}
