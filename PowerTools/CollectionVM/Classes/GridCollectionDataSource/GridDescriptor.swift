//
//  GridDescriptor.swift
//  PowerTools
//
//  Created by Andrea Altea on 25/11/2018.
//

import UIKit

public typealias GridViewDescriptor = ItemViewDescriptor & GridDescriptor

public protocol GridDescriptor: GridItem {
    
    var ratio: ViewRatio { get }
}

public extension GridDescriptor where Self: ItemViewDescriptor {
    
    public func size(in containerView: UIView, module: GridModule) -> CGSize {
        return module.size(self.ratio)
    }
}
