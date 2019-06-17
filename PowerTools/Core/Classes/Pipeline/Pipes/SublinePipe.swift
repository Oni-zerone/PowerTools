//
//  SublinePipe.swift
//  PowerTools
//
//  Created by Andrea Altea on 11/12/2018.
//

import Foundation

open class SublinePipe<Element>: Pipe<[Element]> {
    
    public typealias Content = [Element]
    
    public var shouldPassThrought = false

    internal var pipeline: Pipeline<[Element]>
    private let mergeAction: Merge<Element>.Action
    
    private var promisePipe: PromisePipe<[Element]>? {
        return pipeline.tailPipe as? PromisePipe<[Element]>
    }
    
    public init(merge: Merge<Element>) {
        
        self.pipeline = Pipeline(tailPipe: PromisePipe<[Element]>())
        self.mergeAction = merge.action
        super.init()
    }
    
    open override func success(_ content: [Element]) {
        
        if self.shouldPassThrought {
            self.send(content)
        }
        
        self.setupSuccess(content)
        self.setupFailure(content)
        self.load(content)
    }
    
    private func setupSuccess(_ content: [Element]) {
        
        self.promisePipe?.onSuccess { [weak self] (result) -> Pipe<[Element]>.Result? in
            
            guard let self = self else { return nil }
            let mergedResult = self.mergeAction(content, result)
            self.send(.success(mergedResult))
            return .success(result)
        }
    }
    
    private func setupFailure(_ content: [Element]) {
        
        self.promisePipe?.onFailure { [weak self] (error) -> Pipe<[Element]>.Result? in
            
            self?.send(.success(content))
            return nil
        }
    }
    
    open override func reset() {
        self.pipeline.reset()
        self.send(.reset)
    }
}

extension SublinePipe: AbstractPipeline {
    
    public func attach(_ pipe: Pipe<[Element]>) {
        self.pipeline.attach(pipe)
    }

    public func load(_ baseValue: [Element]) {
        self.pipeline.load(baseValue)
    }
}

public extension AbstractPipeline {
    
    mutating func subline<Element>(merge: Merge<Element>) -> SublinePipe<Element> where Content == [Element] {
        let subline = SublinePipe(merge: merge)
        self.attach(subline)
        return subline
    }
}
