//
//  AsyncPromisePipe.swift
//  PowerTools
//
//  Created by Andrea Altea on 12/05/2019.
//

import Foundation

public class AsyncPromisePipe<Value>: Pipe<Value> {
    
    public typealias SuccessBlock = (Value, _ result: @escaping (Result) -> Void) -> Void
    public typealias FailureBlock = (Error, _ result: @escaping (Result) -> Void) -> Void
    
    var successBlock: SuccessBlock?
    var failureBlock: FailureBlock?
    
    public init(success: SuccessBlock? = nil, failure: FailureBlock? = nil) {
        
        self.successBlock = success
        self.failureBlock = failure
        super.init()
    }
    
    override public func success(_ content: Value) {

        guard let successBlock = self.successBlock else {
            super.success(content)
            return
        }
        
        successBlock(content) { [weak self] result in
            self?.send(result)
        }
    }
    
    override public func failure(_ error: Error) {
        
        guard let failureBlock = self.failureBlock else {
            super.failure(error)
            return
        }
        
        failureBlock(error) { [weak self] result in
            self?.send(result)
        }
    }
    
    public func onSuccess(_ success: @escaping SuccessBlock) {
        self.successBlock = success
    }
    
    public func onFailure(_ failure: @escaping FailureBlock) {
        self.failureBlock = failure
    }
}

public extension AbstractPipeline {
    
    mutating func asyncPromise(success successBlock: AsyncPromisePipe<Content>.SuccessBlock? = nil,
                                     failure failureBlock: AsyncPromisePipe<Content>.FailureBlock? = nil) {
        
        self.attach(AsyncPromisePipe<Content>(success: successBlock, failure: failureBlock))
    }
}
