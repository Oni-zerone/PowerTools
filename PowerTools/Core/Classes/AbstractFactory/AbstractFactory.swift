//
//  AbstractFactory.swift
//  PowerTools
//
//  Created by Andrea Altea on 28/11/2018.
//

import UIKit

public protocol AbstractFactory {
    
    associatedtype Parameters
    
    var parameters: Parameters { get }
    
    var presenterViewController: UIViewController? { get }

    func make(from builder: Builder<Parameters>) -> UIViewController?
    
    func getBuilder(from builderContainer: BuilderContainer) -> Builder<Parameters>?
    
    func showVC(from container: BuilderContainer)

    func presentVC(from builder: Builder<Parameters>, animated: Bool, completion: (() -> Void)?)
    
    func showVC(from builder: Builder<Parameters>, sender: Any?)
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
    
    func getBuilder(from container: BuilderContainer) -> Builder<Parameters>? {
        return container.getBuilder(Parameters.self)
    }
    
    func presentVC(from builder: Builder<Parameters>, animated: Bool, completion: (() -> Void)?) {
        
        guard let viewController = self.make(from: builder) else {
            return
        }
        self.presenterViewController?.present(viewController,
                                              animated: animated,
                                              completion: completion)
    }
    
    func showVC(from builder: Builder<Parameters>, sender: Any?) {
        
        guard let viewController = self.make(from: builder) else {
            return
        }
        self.presenterViewController?.show(viewController, sender: sender)
    }
    
    func make(from builder: Builder<Parameters>) -> UIViewController? {
        return builder.build(self.parameters)
    }
}

public extension AbstractFactory where Self: UIViewController {
    
    var presenterViewController: UIViewController? {
        return self
    }
}
