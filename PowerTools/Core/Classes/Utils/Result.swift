//
//  Result.swift
//  Pods-PowerTools_Example
//
//  Created by Andrea Altea on 11/05/2019.
//

import Foundation

public extension Result {
    
    func map<V>(_ transform: (Success) -> V) -> Result<V, Failure> {
        switch self {
        
        case let .failure(error):
            return .failure(error)
            
        case let .success(value):
            return .success((transform(value)))
        }
    }
 
    struct FailedResult<Failure> {
        
        fileprivate let failure: Failure?
        
        public func failed(_ operation: @escaping (Failure) -> Void) {
            guard let failure = self.failure else { return }
            operation(failure)
        }
    }
    
    @discardableResult
    func done(_ operation: @escaping (Success) -> Void) -> FailedResult<Failure> {
        
        switch self {
        case let .success(value):
            operation(value)
            return FailedResult(failure: nil)
        case let .failure(failure):
            return FailedResult(failure: failure)
        }
    }
}

extension Result.FailedResult where Failure: Error  {
    
    public func `throw`() throws {
        guard let failure = failure else { return }
        throw failure
    }
}
