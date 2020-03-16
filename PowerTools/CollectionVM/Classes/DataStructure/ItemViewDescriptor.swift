//
//  ItemViewDescriptor.swift
//  PowerTools-CollectionVM-Core
//
//  Created by Andrea Altea on 16/03/2020.
//

import Foundation

public protocol ItemViewDescriptor {
    
    var reuseIdentifier: String { get }
}

public class GenericItemViewDescriptor: ItemViewDescriptor {

    public var reuseIdentifier: String
    
    public init(reuseIdentifier: String) {
        self.reuseIdentifier = reuseIdentifier
    }
}
