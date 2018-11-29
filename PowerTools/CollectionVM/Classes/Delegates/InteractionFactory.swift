//
//  InteractionFactory.swift
//  PowerTools
//
//  Created by Andrea Altea on 28/11/2018.
//

import Foundation

public protocol ItemViewModelBuilder: ItemViewModel {
    
    var shouldPresentModally: Bool { get }
    
    func getBuilder<Parameters>(_ parametersType: Parameters.Type) -> Builder<Parameters>?
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
            let builder = itemBuilder.getBuilder(Parameters.self)  else {
                return
        }
        
        if itemBuilder.shouldPresentModally {
            self.presentVC(from: builder, animated: true, completion: nil)
            return
        }
        self.showVC(from: builder, sender: self)
    }
}
