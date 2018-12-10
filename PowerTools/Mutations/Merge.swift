//
//  Merge.swift
//  PowerTools
//
//  Created by Andrea Altea on 11/12/2018.
//

import Foundation

public struct Merge<Element> {
    
    public typealias Action = ([Element], [Element]) -> [Element]
    
    public var action: Action
}

public extension Array {
    
    public func merge(contents: [Element], mode: Merge<Element>) -> [Element] {
        return mode.action(self, contents)
    }
}
