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
    
    internal init(referenceSize: CGSize, interitemSpacing: CGFloat, interlineSpacing: CGFloat, maxWidth: CGFloat) {
        
        self.moduleSize = referenceSize
        self.maxWidth = maxWidth
        self.interitemSpacing = interitemSpacing
        self.interlineSpacing = interlineSpacing
    }
    
    public func size(horizontal: CGFloat = 1.0, vertical: CGFloat = 1.0) -> CGSize {

        let itemWidth = self.moduleSize.width * horizontal + self.interitemSpacing * (horizontal - 1)
        let itemHeight = self.moduleSize.height * vertical + self.interlineSpacing * (vertical - 1)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
