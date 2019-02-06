//
//  Pipeline.swift
//  PowerTools
//
//  Created by Andrea Altea on 08/12/2018.
//

import Foundation

public struct Pipeline<Value> {
    
    var pipes: [Pipe<Value>]
    
    public init() {
        self.pipes = []
    }
    
    public mutating func attach(_ pipe: Pipe<Value>) {
        
        if let lastPipe = self.pipes.last {
            lastPipe.nextPipe = pipe
        }
        self.pipes.append(pipe)
    }

    public mutating func attach(_ pipes: [Pipe<Value>]) {
        pipes.forEach({ self.attach($0) })
    }

    public mutating func attach(_ pipes: Pipe<Value>...) {
        self.attach(pipes)
    }
    
    public func reset() {
        self.pipes.first?.process(.reset)
    }
    
    public func load(_ baseValue: Value) {
        self.pipes.first?.process(.success(baseValue))
    }
}
