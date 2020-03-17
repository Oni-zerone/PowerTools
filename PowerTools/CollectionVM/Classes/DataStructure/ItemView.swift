//
//  File.swift
//  PowerTools-CollectionVM-Core
//
//  Created by Andrea Altea on 15/03/2020.
//

import Foundation

public protocol ItemView {
    
    static var descriptor: ItemViewDescriptor { get }
    
    func setup(_ model: ItemViewModel, in containerView: UIView, at indexPath: IndexPath)
}

public extension ItemView {
    
    static var descriptor: ItemViewDescriptor {
        return GenericItemViewDescriptor(reuseIdentifier: String(describing: Self.self))
    }
}
