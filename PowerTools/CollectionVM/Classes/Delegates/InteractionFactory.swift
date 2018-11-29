//
//  InteractionFactory.swift
//  PowerTools
//
//  Created by Andrea Altea on 28/11/2018.
//

import Foundation

public typealias InteractionFactory = InteractionDelegate & AbstractFactory

public extension InteractionDelegate where Self: AbstractFactory {
    
    func containerView(_ containerView: UIView, shouldSelect item: ItemViewModel) -> Bool {
        return item is BuilderContainer
    }
    
    func containerView(_ containerView: UIView, didSelect item: ItemViewModel) {
        
        guard let builderContainer = item as? BuilderContainer else {
            return
        }
        
        self.showVC(from: builderContainer)
    }
}
