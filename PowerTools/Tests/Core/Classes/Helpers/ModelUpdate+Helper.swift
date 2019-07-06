//
//  File.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 27/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

@testable import PowerTools

extension ModelUpdate.Change {
    
    var description: String {
        switch self {
        case .insert(let newPosition):
            return "nil -> \(newPosition.description)"
            
        case .move(let oldPosition, let newPosition):
            return "\(oldPosition) -> \(newPosition)"
            
        case .delete(let oldPosition):
            return "\(oldPosition) -> nil"
        }
    }
}
