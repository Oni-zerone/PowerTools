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
            do {
                try self.success(value)
            } catch let error {
                self.send(.failure(error))
            }
        
        case .failure(let error):
            self.failure(error)
        
        case .reset:
            self.reset()
        }
    }
    
    open func success(_ content: Value) throws {
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
