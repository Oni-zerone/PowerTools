//
//  ItemViewModel.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import Foundation

public struct ViewRatio {
    
    var multiplier: Float
    
    var constant: Float
}

public protocol ItemViewDescriptor {
    
    var reuseIdentifier: String { get }
    
    var viewRatio: ViewRatio { get }
}

public protocol ItemViewModel {
    
    var descriptor: ItemViewDescriptor { get set }
    
    var reuseIdentifier: String { get }
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath)
}

public extension ItemViewModel {
    
    var reuseIdentifier: String {
        return self.descriptor.reuseIdentifier
    }
}
