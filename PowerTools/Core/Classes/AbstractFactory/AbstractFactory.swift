//
//  AbstractFactory.swift
//  PowerTools
//
//  Created by Andrea Altea on 28/11/2018.
//

import UIKit

public protocol AbstractFactory {
    
    associatedtype Context
    
    var context: Context { get }
    
    var presenterViewController: UIViewController? { get }

    func make(from builder: Builder<Context>) -> UIViewController?
    
    func getBuilder(from builderContainer: BuilderContainer) -> Builder<Context>?
    
    func showVC(from container: BuilderContainer)

    func presentVC(from builder: Builder<Context>, animated: Bool, completion: (() -> Void)?)
    
    func showVC(from builder: Builder<Context>, sender: Any?)
}

public extension AbstractFactory {
    
    func showVC(from container: BuilderContainer) {
        
        guard let builder = self.getBuilder(from: container) else {
            return
        }

        if container.shouldPresentModally {
            self.presentVC(from: builder, animated: true, completion: nil)
            return
        }
        self.showVC(from: builder, sender: self)
    }
    
    func getBuilder(from container: BuilderContainer) -> Builder<Context>? {
        return container.getBuilder(Context.self)
    }
    
    func presentVC(from builder: Builder<Context>, animated: Bool, completion: (() -> Void)?) {
        
        guard let viewController = self.make(from: builder) else {
            return
        }
        self.presenterViewController?.present(viewController,
                                              animated: animated,
                                              completion: completion)
    }
    
    func showVC(from builder: Builder<Context>, sender: Any?) {
        
        guard let viewController = self.make(from: builder) else {
            return
        }
        self.presenterViewController?.show(viewController, sender: sender)
    }
    
    func make(from builder: Builder<Context>) -> UIViewController? {
        return builder.build(self.context)
    }
}

public extension AbstractFactory where Self: UIViewController {
    
    var presenterViewController: UIViewController? {
        return self
    }
}
