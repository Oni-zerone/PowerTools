//
//  ModelUpdate.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import PowerTools

extension ModelUpdate.Change: Equatable {
    
    public static func == (lhs: ModelUpdate.Change, rhs: ModelUpdate.Change) -> Bool {
        switch (lhs, rhs) {
            
        case (let .insert(lhsNewPosition), let .insert(rhsNewPosition)):
            return lhsNewPosition == rhsNewPosition
            
        case (let .delete(lhsOldPosition), let .delete(rhsOldPosition)):
            return lhsOldPosition == rhsOldPosition
            
        case(let .move(lhsOldPosition, lhsNewPosition), let .move(rhsOldPosition, rhsNewPosition)):
            return lhsOldPosition == rhsOldPosition && lhsNewPosition == rhsNewPosition
            
        default:
            return false
        }
    }
}

extension ModelUpdate.Change {
    
    func isInsert(_ position: IndexPath) -> Bool {
        
        switch self {
        case .insert(let newPosition):
            return position == newPosition
            
        default:
            return false
        }
    }
    
    func isDelete(_ position: IndexPath) -> Bool {
        
        switch self {
        case .delete(let oldPosition):
            return position == oldPosition
            
        default:
            return false
        }
    }
    
    func isMove(_ old: IndexPath, _ new: IndexPath) -> Bool {
        switch self {
        case .move(let oldPosition, let newPosition):
            return oldPosition == old && newPosition == new
            
        default:
            return false
        }
    }
}
