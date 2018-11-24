//
//  InteractionDelegate.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 08/11/2018.
//

import UIKit

public protocol InteractionDelegate: class {
    
    func containerView(_ containerView: UIView, shouldSelect item: ItemViewModel) -> Bool
    
    func containerView(_ containerView: UIView, didSelect item: ItemViewModel)
    
    func containerView(_ containerView: UIView, shouldDeselect item: ItemViewModel) -> Bool
    
    func containerView(_ containerView: UIView, didDeselect item: ItemViewModel)

    func containerView(_ containerView: UIView, shouldHighlight item: ItemViewModel) -> Bool

    func containerView(_ containerView: UIView, didHighlight item: ItemViewModel)
    
    func containerView(_ containerView: UIView, didUnhighlight item: ItemViewModel)
}

public extension InteractionDelegate {
    
    func containerView(_ containerView: UIView, shouldSelect item: ItemViewModel) -> Bool {
        return true
    }
    
    func containerView(_ containerView: UIView, didSelect item: ItemViewModel) {  }
    
    func containerView(_ containerView: UIView, shouldDeselect item: ItemViewModel) -> Bool {
        return true
    }
    
    func containerView(_ containerView: UIView, didDeselect item: ItemViewModel) {  }
    
    func containerView(_ containerView: UIView, shouldHighlight item: ItemViewModel) -> Bool {
        return true
    }
    
    func containerView(_ containerView: UIView, didHighlight item: ItemViewModel) {  }
    
    func containerView(_ containerView: UIView, didUnhighlight item: ItemViewModel) {  }
}
