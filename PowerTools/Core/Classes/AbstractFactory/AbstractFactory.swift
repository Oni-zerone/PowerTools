//
//  AbstractFactory.swift
//  PowerTools
//
//  Created by Andrea Altea on 28/11/2018.
//

import UIKit

open class Builder<Parameters> {
    
    public init() {  }
    
    open func build(_ parameters: Parameters) -> UIViewController? {
        return nil
    }
}

public protocol AbstractFactory {
    
    associatedtype Parameters
    
    var parameters: Parameters { get }
    
    var presenterViewController: UIViewController? { get }
    
    func make(from builder: Builder<Parameters>) -> UIViewController?
    
    func presentVC(from builder: Builder<Parameters>, animated: Bool, completion: (() -> Void)?)
    
    func showVC(from builder: Builder<Parameters>, sender: Any?)
}

public extension AbstractFactory {
    
    func make(from builder: Builder<Parameters>) -> UIViewController? {
        return builder.build(self.parameters)
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
}

public extension AbstractFactory where Self: UIViewController {
    
    var presenterViewController: UIViewController? {
        return self
    }
}
