//
//  InteractionFactory.swift
//  PowerTools
//
//  Created by Andrea Altea on 28/11/2018.
//

import Foundation

public typealias ControllerBuilder = ItemViewModel & AbstractBuilder

open class BaseViewModel<ParameterType>: NSObject, ItemViewModel, AbstractBuilder {

    public typealias Parameters = ParameterType
    
    open var descriptor: ItemViewDescriptor
    
    open func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {
        
    }
    
    open func build(_ parameters: ParameterType) -> UIViewController? {
        return nil
    }
    
    public init(descriptor: ItemViewDescriptor) {
        self.descriptor = descriptor
    }
}

open class Factory<ParameterType>: AbstractFactory {

    public typealias Parameters = ParameterType
    
    public var parameters: ParameterType
    
    public weak var presenterViewController: UIViewController?
    
    public init(parameters: ParameterType, presenterViewController vc: UIViewController? = nil) {
        
        self.parameters = parameters
        self.presenterViewController = vc
    }
}

extension Factory: InteractionDelegate {
    
    public func containerView(_ containerView: UIView, shouldSelect item: ItemViewModel) -> Bool {
        return item is BaseViewModel<ParameterType>
    }
    
    public func containerView(_ containerView: UIView, didSelect item: ItemViewModel) {
        guard let builder = item as? BaseViewModel<ParameterType> else {
            return
        }
        self.showVC(from: builder, sender: self)
    }
}
