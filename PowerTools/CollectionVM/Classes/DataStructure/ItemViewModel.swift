//
//  ItemViewModel.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import Foundation

public protocol ItemViewModel {
    
    var descriptor: ItemViewDescriptor { get set }
    
    var hashValue: Int { get }
    
    var reuseIdentifier: String { get }
}

public extension ItemViewModel {
    
    var reuseIdentifier: String {
        return self.descriptor.reuseIdentifier
    }
}
