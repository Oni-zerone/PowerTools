//
//  Pipeline.swift
//  PowerTools
//
//  Created by Andrea Altea on 08/12/2018.
//

import Foundation

public struct Pipeline<Value>: AbstractPipeline {
    
    public typealias Content = Value
    
    public var headPipe: Pipe<Value>? {
        didSet {
            self.headPipe?.nextPipe = self.pipes.first ?? self.tailPipe
        }
    }
    var pipes: [Pipe<Value>]
    
    public var tailPipe: Pipe<Value>? {
        didSet {
            (self.pipes.last ?? self.headPipe)?.nextPipe = tailPipe
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
    
    public func reset() {
        (self.headPipe ?? self.pipes.first)?.process(.reset)
    }
    
    public func load(_ baseValue: Value) {
        (self.headPipe ?? self.pipes.first ?? self.tailPipe)?.process(.success(baseValue))
    }
}
