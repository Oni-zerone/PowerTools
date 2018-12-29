//
//  SublinePipe.swift
//  PowerTools
//
//  Created by Andrea Altea on 11/12/2018.
//

import Foundation

open class SublinePipe<Element>: Pipe<[Element]> {
    
    public var shouldPassThrought = false
    
    var subline = [Pipe<[Element]>]()
    let mergeAction: Merge<Element>.Action
    let mergePipe = PromisePipe<[Element]>()
    
    public init(merge: Merge<Element>) {
        
        self.mergeAction = merge.action
        super.init()
    }

    public func attach(_ pipes: Pipe<[Element]>...) {
        pipes.forEach({ self.attach($0) })
    }
    
    public func attach(_ pipe: Pipe<[Element]>) {
        
        pipe.nextPipe = self.mergePipe
        if let lastPipe = self.subline.last {
            lastPipe.nextPipe = pipe
        }
        self.subline.append(pipe)
    }

    open override func success(_ content: [Element]) throws {
 
        if self.shouldPassThrought {
            try super.success(content)
        }
        
        self.mergePipe.onSuccess { [weak self] (result) -> [Element] in

            guard let strongSelf = self else {
                return result
            }

            let mergedResult = strongSelf.mergeAction(content, result)
            strongSelf.send(.success(mergedResult))
            return result
        }
        
        self.mergePipe.onFailure { [weak self] (error) -> Pipe<[Element]>.Result in
            
            self?.send(.success(content))
            return .failure(error)
        }
        
        self.subline.first?.process(.success([]))
    }
    
    open override func reset() {
        
        self.subline.first?.reset()
        super.reset()
    }
}
