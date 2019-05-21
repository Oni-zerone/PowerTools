//
//  Operators.swift
//  Pods-PowerTools_Example
//
//  Created by Andrea Altea on 21/05/2019.
//

import Foundation

infix operator ?==
public func ?==<T: Equatable>(lhs: T?, rhs: T) -> Bool {
    guard let lhs = lhs else { return false }
    return lhs == rhs
}
