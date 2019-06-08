//
//  File.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

infix operator ?== : ComparisonPrecedence

func ?== <T: Equatable>(lhs: T?, rhs: T) -> Bool {
    guard let lhs = lhs else { return false }
    return lhs == rhs
}
