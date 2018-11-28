//
//  InteractionFactory.swift
//  PowerTools
//
//  Created by Andrea Altea on 28/11/2018.
//

import Foundation

public typealias ControllerBuilder = ItemViewModel & AbstractBuilder

public protocol ItemViewModelBuilder: ItemViewModel {
    
    var shouldPresentModally: Bool { get }
    
    func getController<Parameters>(with parameters: Parameters) -> UIViewController?
}

public extension ItemViewModelBuilder {
    
    var shouldPresentModally: Bool {
        return false
    }
}

public extension InteractionDelegate where Self: AbstractFactory {
    
    func containerView(_ containerView: UIView, shouldSelect item: ItemViewModel) -> Bool {
        return item is ItemViewModelBuilder
    }
    
    func containerView(_ containerView: UIView, didSelect item: ItemViewModel) {
        
        guard let itemBuilder = item as? ItemViewModelBuilder,
            let controller = itemBuilder.getController(with: self.parameters) else {
                return
        }
        
        if itemBuilder.shouldPresentModally {
            self.presenterViewController?.present(controller, animated: true, completion: nil)
            return
        }
        self.presenterViewController?.show(controller, sender: self)
    }
}
