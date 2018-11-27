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
}
