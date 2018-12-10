//
//  Transform.swift
//  PowerTools
//
//  Created by Andrea Altea on 11/12/2018.
//

import Foundation

public struct Transform<Element> {
    
    public typealias Action = ([Element]) -> [Element]
    
    public var action: Action
}

public extension Array {
    
    public func mutate(_ transformation: Transform<Element>) -> [Element] {
        return transformation.action(self)
    }
}
