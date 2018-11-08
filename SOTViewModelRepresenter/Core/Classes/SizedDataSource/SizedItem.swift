//
//  SizedItem.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public protocol SizedItem {
    
    func size(in containerView: UIView, module: SizeModule) -> CGSize
}

extension SizedItem where Self: ItemViewModel {
    
    func size(in containerView: UIView, module: SizeModule) -> CGSize {
        
        guard let descriptor = self.descriptor as? SizedItem else {
            return module.size()
        }
        
        return descriptor.size(in: containerView, module: module)
    }
}
