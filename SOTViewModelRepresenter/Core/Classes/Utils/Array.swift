//
//  Array.swift
//  Pods-SOTViewModelRepresenter_Example
//
//  Created by Andrea Altea on 08/11/2018.
//

import Foundation

internal extension Array {
    
    func item(at index: Int) -> Element? {
        guard self.indices.contains(index) else {
            return nil
        }
        return self[index]
    }
}
