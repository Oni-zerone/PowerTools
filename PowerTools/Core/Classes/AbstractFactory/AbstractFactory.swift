//
//  AbstractFactory.swift
//  PowerTools
//
//  Created by Andrea Altea on 28/11/2018.
//

import UIKit

public protocol AbstractBuilder {
    
    associatedtype Parameters
    
    func build(_ parameters: Parameters) -> UIViewController?
}

public protocol AbstractFactory {
    
    associatedtype Parameters
    
    var parameters: Parameters { get }
    
    var presenterViewController: UIViewController? { get }
    
    func make<Builder: AbstractBuilder>(from builder: Builder) -> UIViewController? where Builder.Parameters == Parameters
    
    func presentVC<Builder: AbstractBuilder>(from builder: Builder, animated: Bool, completion: (() -> Void)?) where Builder.Parameters == Parameters
    
    func showVC<Builder: AbstractBuilder>(from builder: Builder, sender: Any?) where Builder.Parameters == Parameters
}

public extension AbstractFactory {
    
    func make<Builder: AbstractBuilder>(from builder: Builder) -> UIViewController? where Builder.Parameters == Parameters {
        return builder.build(self.parameters)
    }
    
    func presentVC<Builder: AbstractBuilder>(from builder: Builder, animated: Bool, completion: (() -> Void)?) where Builder.Parameters == Parameters {
        guard let viewController = self.make(from: builder) else {
            return
        }
        self.presenterViewController?.present(viewController,
                                              animated: animated,
                                              completion: completion)
    }
    
    func showVC<Builder: AbstractBuilder>(from builder: Builder, sender: Any?) where Builder.Parameters == Parameters {
        guard let viewController = self.make(from: builder) else {
            return
        }
        self.presenterViewController?.show(viewController, sender: sender)
    }
}

public extension AbstractFactory where Self: UIViewController {
    
    var presenterViewController: UIViewController? {
        return self
    }
}
