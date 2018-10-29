//
//  SizeModule.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import Foundation

public struct SizeModule {
    
    public var moduleSize: CGSize
    
    public var maxWidth: CGFloat
    
    public var interitemSpacing: CGFloat
    
    public var interlineSpacing: CGFloat
    
    internal init(_ cellWidth: CGFloat, interitemSpacing: CGFloat, interlineSpacing: CGFloat, multiplier: CGFloat, constant: CGFloat, maxWidth: CGFloat) {
        
        self.moduleSize = CGSize(width: cellWidth, height: cellWidth * multiplier + constant)
        self.maxWidth = maxWidth
        self.interitemSpacing = interitemSpacing
        self.interlineSpacing = interlineSpacing
    }
    
    public func size(_ reference: CGPoint) -> CGSize {
        
        let itemWidth = self.moduleSize.width * reference.x + self.interitemSpacing * (reference.x - 1)
        let itemHeight = self.moduleSize.height * reference.y + self.interlineSpacing * (reference.y - 1)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    public func size(parallel: CGFloat = 1.0, perpendicular: CGFloat = 1.0) -> CGSize {
        
        let scale = CGPoint(x: parallel, y: perpendicular)
        return self.size(scale)
    }
}

