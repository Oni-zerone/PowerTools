//
//  Pipe.swift
//  PowerTools
//
//  Created by Andrea Altea on 08/12/2018.
//

import Foundation

open class Pipe<Value> {
    
    public enum Result {
        
        case success(_ value: Value)
        case failure(_ error: Error)
        case reset
    }
    
    weak var nextPipe: Pipe?
    
    public init() {   }
    
    func process(_ result: Result) {
        
        switch result {
            
        case .success(let value):
            self.success(value)
            
        case .failure(let error):
            self.failure(error)
            
        case .reset:
            self.reset()
        }
    }
    
    open func success(_ content: Value) {
        self.send(content)
    }
    
    open func failure(_ error: Error) {
        self.send(error)
    }
    
    open func reset() {
        self.send(.reset)
    }
    
    public func send(_ result: Result) {
        self.nextPipe?.process(result)
    }
    
    public func send(_ content: Value) {
        self.send(.success(content))
    }
    
    public func send(_ error: Error) {
        self.send(.failure(error))
    }
}
