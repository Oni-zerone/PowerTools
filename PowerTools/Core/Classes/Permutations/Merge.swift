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

public extension Merge {
    
    static var injectBefore: Merge<Element> {
        
        return Merge { (first, second) -> [Element] in
            var mutableFirst = first
            mutableFirst.insert(contentsOf: second, at: 0)
            return mutableFirst
        }
    }
    
    static var injectAfter: Merge<Element> {
        
        return Merge { (items, contents) -> [Element] in
            var mutableItems = items
            mutableItems.append(contentsOf: contents)
            return mutableItems
        }
    }
    
    static func inject(at index: Int = 0) -> Merge<Element> {
        
        return Merge { (first, second) -> [Element] in
            var mutableFirst = first
            let splitIndex = max(0, min(first.count, index))
            mutableFirst.insert(contentsOf: second, at: splitIndex)
            return mutableFirst
        }
    }
    
    static func inject(offset: Int, frequency: Int) -> Merge<Element> {
        
        return Merge { (first, second) -> [Element] in
            return first.inserting(second, offset: offset, frequency: frequency)
        }
    }
}

public extension Array {
    
    func merge(contents: [Element], mode: Merge<Element>) -> [Element] {
        return mode.action(self, contents)
    }
}
