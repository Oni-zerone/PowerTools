//
//  PromisePipe.swift
//  PowerTools
//
//  Created by Andrea Altea on 09/12/2018.
//

import Foundation

public class PromisePipe<Value>: Pipe<Value> {

    public typealias SuccessBlock = (Value) throws -> Value
    public typealias FailureBlock = (Error) -> Result

    var successBlock: SuccessBlock?
    var failureBlock: FailureBlock?

    public init(success: SuccessBlock? = nil, failure: FailureBlock? = nil) {
        
        self.successBlock = success
        self.failureBlock = failure
        super.init()
    }
    
    override public func success(_ content: Value) throws {
        
        guard let block = self.successBlock else {
            try super.success(content)
            return
        }

        try super.success(block(content))
    }
    
    override public func failure(_ error: Error) {
        
        guard let block = self.failureBlock else {
            super.failure(error)
            return
        }
        self.send(block(error))
    }
    
    public func onSuccess(_ success: @escaping SuccessBlock) {
        self.successBlock = success
    }
    
    public func onFailure(_ failure: @escaping FailureBlock) {
        self.failureBlock = failure
    }
}
