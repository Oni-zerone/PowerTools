//
//  GridDescriptor.swift
//  PowerTools
//
//  Created by Andrea Altea on 25/11/2018.
//

import UIKit

public struct ViewRatio: Equatable {
    
    public var multiplier: CGFloat
    
    public var constant: CGFloat
    
    public init(multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
        self.multiplier = multiplier
        self.constant = constant
    }
    
    public static let standard = ViewRatio(multiplier: 1.0, constant: 0.0)
}

public typealias GridViewDescriptor = ItemViewDescriptor & GridDescriptor

public protocol GridDescriptor: GridItem {
    
    var ratio: ViewRatio { get }
}

public extension GridDescriptor where Self: ItemViewDescriptor {
    
    func size(in containerView: UIView, module: GridModule) -> CGSize {
        return module.size(self.ratio)
    }
}
