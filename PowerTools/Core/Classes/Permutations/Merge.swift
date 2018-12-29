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
    
    public static var injectBefore: Merge<Element> {
        
        return Merge { (first, second) -> [Element] in
            var mutableFirst = first
            mutableFirst.insert(contentsOf: second, at: 0)
            return mutableFirst
        }
    }
    
    public static var injectAfter: Merge<Element> {
        
        return Merge { (items, contents) -> [Element] in
            var mutableItems = items
            mutableItems.append(contentsOf: contents)
            return mutableItems
        }
    }
    
    public static func inject(at index: Int = 0) -> Merge<Element> {
        
        return Merge { (first, second) -> [Element] in
            var mutableFirst = first
            let splitIndex = max(0, min(first.count, index))
            mutableFirst.insert(contentsOf: second, at: splitIndex)
            return mutableFirst
        }
    }
    
    public static func inject(offset: Int, frequency: Int) -> Merge<Element> {
        
        return Merge { (first, second) -> [Element] in
            var mutableFirst = first
            (0 ..< second.count).forEach{ index in
                let safeIndex = max(0, min((index * frequency) + offset, mutableFirst.count))
                mutableFirst.insert(second[index], at: safeIndex)
            }
            return mutableFirst
        }
    }
}

public extension Array {
    
    public func merge(contents: [Element], mode: Merge<Element>) -> [Element] {
        return mode.action(self, contents)
    }
}
