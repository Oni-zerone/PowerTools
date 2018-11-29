//
//  BuilderContainer.swift
//  PowerTools
//
//  Created by Andrea Altea on 29/11/2018.
//

import Foundation

public protocol BuilderContainer {
    
    var shouldPresentModally: Bool { get }
    
    func getBuilder<Parameters>(_ parametersType: Parameters.Type) -> Builder<Parameters>?
}

public extension BuilderContainer {
    
    var shouldPresentModally: Bool {
        return false
    }
}
