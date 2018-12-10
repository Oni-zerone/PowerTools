//
//  SublinePipe.swift
//  PowerTools
//
//  Created by Andrea Altea on 11/12/2018.
//

import Foundation

open class SublinePipe<Value>: Pipe<[Value]> {
    
    var subline = [Pipe<[Value]>]()
    let mergeAction: Merge<Value>.Action
    let mergePipe = PromisePipe<[Value]>()
    
    init(merge: Merge<Value>) {
        
        self.mergeAction = merge.action
        super.init()
    }
    
    public func attach(_ pipe: Pipe<[Value]>) {
        
        pipe.nextPipe = self.mergePipe
        if let lastPipe = self.subline.last {
            lastPipe.nextPipe = pipe
        }
        self.subline.append(pipe)
    }
    
    open override func success(_ content: [Value]) throws {
 
        self.mergePipe.onSuccess { [weak self] (result) -> [Value] in

            guard let strongSelf = self else {
                return result
            }

            let mergedResult = strongSelf.mergeAction(content, result)
            strongSelf.send(.success(mergedResult))
            return result
        }
        
        self.mergePipe.onFailure { [weak self] (error) -> Pipe<[Value]>.Result in
            
            self?.send(.success(content))
            return .failure(error)
        }
        
        self.subline.first?.process(.success([]))
        try super.success(content)
    }
    
    open override func reset() {
        
        self.subline.first?.reset()
        super.reset()
    }
}
