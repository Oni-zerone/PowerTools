//
//  DirectionableContainer.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 29/10/18.
//

import Foundation

public enum ContentDirection {
    
    case vertical
    case horizontal
}

public protocol DirectionableContainer {
    
    var contentDirection: ContentDirection { get }
}
