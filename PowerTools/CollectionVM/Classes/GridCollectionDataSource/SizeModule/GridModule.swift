//
//  GridModule.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import Foundation
import CoreGraphics

public struct GridModule {
    
    public var direction: ContentDirection
    
    public var referenceSize: CGFloat
    
    public var maxSize: CGFloat
    
    public func size(_ ratio: ViewRatio = .standard) -> CGSize {
        
        switch self.direction {
            
        case .horizontal:
            return self.sizeFromReferenceHeight(for: ratio)

        case .vertical:
            return self.sizeFromReferenceWidth(for: ratio)
        }
    }
}

internal extension GridModule {
    
    func sizeFromReferenceWidth(for ratio: ViewRatio) -> CGSize {
        
        let width = self.referenceSize
        let height = (width * ratio.multiplier) + ratio.constant
        return CGSize(width: width, height: min(abs(height), self.maxSize))
    }
    
    func sizeFromReferenceHeight(for ratio: ViewRatio) -> CGSize {
        
        let height = self.referenceSize
        guard ratio.multiplier != 0 else {
            return CGSize(width: abs(ratio.constant), height: height)
        }
        let width = (height - ratio.constant) / ratio.multiplier
        return CGSize(width: min(abs(width), self.maxSize), height: height)
    }
}
