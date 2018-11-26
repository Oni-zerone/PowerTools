//
//  GridItem.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public typealias GridItemViewModel = ItemViewModel & GridItem

public protocol GridItem {
    
    func size(in containerView: UIView, module: GridModule) -> CGSize
}

public extension GridItem where Self: ItemViewModel {
    
    func size(in containerView: UIView, module: GridModule) -> CGSize {
        
        guard let descriptor = self.descriptor as? GridDescriptor else {
            return module.size()
        }
        return descriptor.size(in: containerView, module: module)
    }
}
