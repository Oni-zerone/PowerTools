//
//  BuilderContainer.swift
//  PowerTools
//
//  Created by Andrea Altea on 29/11/2018.
//

import Foundation

public protocol BuilderContainer {
    
    var shouldPresentModally: Bool { get }
    
    func getBuilder<Context>(_ contextType: Context.Type) -> Builder<Context>?
}

public extension BuilderContainer {
    
    var shouldPresentModally: Bool {
        return false
    }
}
