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
    
    open var shouldPassThroughtProcess = true
    
    weak var nextPipe: Pipe?
    
    func process(_ result: Result) {
        
        switch result {
            
        case .success(let value):
            self.success(value)
        
        case .failure(let error):
            self.failure(error)
        
        case .reset:
            self.reset()
        }
        
        if shouldPassThroughtProcess {
            self.send(result)
        }
    }
    
    open func success(_ content: Value) {
        self.send(.success(content))
    }
    
    open func failure(_ error: Error) {
        self.send(.failure(error))
    }
    
    open func reset() {
        self.send(.reset)
    }
    
    func send(_ result: Result) {
        self.nextPipe?.process(result)
    }
}
