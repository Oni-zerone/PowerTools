//
//  Merge.swift
//  PowerTools
//
//  Created by Andrea Altea on 11/12/2018.
//

import Foundation

struct Merge<Element> {
    
    typealias MergeBlock = ([Element], [Element]) -> [Element]
    
    var action: MergeBlock
}

extension Array {
    
    func merge(contents: [Element], mode: Merge<Element>) -> [Element] {
        return mode.action(self, contents)
    }
}
