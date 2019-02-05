//
//  Array.swift
//  Pods-SOTViewModelRepresenter_Example
//
//  Created by Andrea Altea on 08/11/2018.
//

import Foundation

public extension Array {
    
    func item(at index: Int) -> Element? {
        guard self.indices.contains(index) else {
            return nil
        }
        return self[index]
    }
    
    mutating func append(_ optionalElement: Element?) {
        guard let element = optionalElement else {
            return
        }
        self.append(element)
    }
    
    func appending(_ element: Element) -> Array<Element> {
        var array = self
        array.append(element)
        return array
    }
    
    mutating func insert(_ elements: [Element], offset: Int, frequency: Int) {
        (0 ..< elements.count).forEach { index in
            let minIndex = Swift.min(index + (index * frequency) + offset, self.count)
            let safeIndex = Swift.max(0, minIndex)
            self.insert(elements[index], at: safeIndex)
        }
    }
    
    func inserting(_ elements: [Element], offset: Int, frequency: Int) -> Array<Element> {
        var mutableArray = self
        mutableArray.insert(elements, offset: offset, frequency: frequency)
        return mutableArray
    }
}
