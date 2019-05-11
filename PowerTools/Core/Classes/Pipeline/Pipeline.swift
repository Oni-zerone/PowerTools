//
//  Pipeline.swift
//  PowerTools
//
//  Created by Andrea Altea on 08/12/2018.
//

import Foundation

public struct Pipeline<Value> {
    
    public var headPipe: Pipe<Value>? {
        didSet {
            headPipe?.nextPipe = pipes.first
        }
    }
    var pipes: [Pipe<Value>]
    
    public var tailPipe: Pipe<Value>? {
        didSet {
            pipes.last?.nextPipe = tailPipe
        }
    }
    
    public init(headPipe: Pipe<Value>? = nil, tailPipe: Pipe<Value>? = nil) {
        self.headPipe = headPipe
        self.pipes = []
        self.tailPipe = tailPipe
    }
    
    public mutating func attach(_ pipe: Pipe<Value>) {
        
        if let lastPipe = self.pipes.last ?? self.headPipe {
            lastPipe.nextPipe = pipe
        }
        pipe.nextPipe = tailPipe
        self.pipes.append(pipe)
    }

    public mutating func attach(_ pipes: [Pipe<Value>]) {
        pipes.forEach({ self.attach($0) })
    }

    public mutating func attach(_ pipes: Pipe<Value>...) {
        self.attach(pipes)
    }
    
    public func reset() {
        (self.headPipe ?? self.pipes.first)?.process(.reset)
    }
    
    public func load(_ baseValue: Value) {
        (self.headPipe ?? self.pipes.first)?.process(.success(baseValue))
    }
}
