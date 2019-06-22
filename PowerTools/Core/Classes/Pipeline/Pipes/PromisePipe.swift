//
//  PromisePipe.swift
//  PowerTools
//
//  Created by Andrea Altea on 09/12/2018.
//

import Foundation

public class PromisePipe<Value>: Pipe<Value> {
    
    public typealias SuccessBlock = (Value) -> Result?
    public typealias FailureBlock = (Error) -> Result?
    public typealias ResetBlock = () -> Result?
    
    var successBlock: SuccessBlock?
    var failureBlock: FailureBlock?
    var resetBlock: ResetBlock?
    
    public init(success: SuccessBlock? = nil, failure: FailureBlock? = nil, reset: ResetBlock? = nil) {
        
        self.successBlock = success
        self.failureBlock = failure
        self.resetBlock = reset
        super.init()
    }
    
    override public func success(_ content: Value) {
        
        guard let block = self.successBlock,
            let result = block(content) else {
                self.send(content)
                return
        }
        self.send(result)
    }
    
    override public func failure(_ error: Error) {
        
        guard let block = self.failureBlock,
            let result = block(error) else {
                super.failure(error)
                return
        }
        self.send(result)
    }
    
    public func onSuccess(_ success: @escaping SuccessBlock) {
        self.successBlock = success
    }
    
    public func onFailure(_ failure: @escaping FailureBlock) {
        self.failureBlock = failure
    }
}

public extension AbstractPipeline {
    
    mutating func promise(success successBlock: PromisePipe<Content>.SuccessBlock? = nil,
                          failure failureBlock: PromisePipe<Content>.FailureBlock? = nil) {
        
        self.attach(PromisePipe<Content>(success: successBlock, failure: failureBlock))
    }
}
