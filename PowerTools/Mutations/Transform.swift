//
//  Transform.swift
//  PowerTools
//
//  Created by Andrea Altea on 11/12/2018.
//

import Foundation

struct Transform<Element> {
    
    typealias TransformBlock = ([Element]) -> [Element]
    
    var action: TransformBlock
}

extension Array {
    
    func mutate(_ transformation: Transform<Element>) -> [Element] {
        return transformation.action(self)
    }
}
