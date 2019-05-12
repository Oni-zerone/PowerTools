//
//  AbstractPipeline.swift
//  PowerTools
//
//  Created by Andrea Altea on 12/05/2019.
//

import Foundation

public protocol AbstractPipeline {
    
    associatedtype Content
    
    mutating func attach(_ pipe: Pipe<Content>)
    mutating func attach(_ pipes: [Pipe<Content>])
    
    func reset()
    func load(_ baseValue: Content)
}

public extension AbstractPipeline {
    
    mutating func attach(_ pipes: [Pipe<Content>]) {
        pipes.forEach({ self.attach($0) })
    }
}
