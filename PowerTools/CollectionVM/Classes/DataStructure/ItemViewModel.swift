//
//  ItemViewModel.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import Foundation

public struct ViewRatio: Equatable {
    
    public var multiplier: CGFloat
    
    public var constant: CGFloat
    
    public init(multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
        self.multiplier = multiplier
        self.constant = constant
    }
    
    public static let standard = ViewRatio(multiplier: 1.0, constant: 0.0)
}

public protocol ItemViewDescriptor {
    
    var reuseIdentifier: String { get }
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
