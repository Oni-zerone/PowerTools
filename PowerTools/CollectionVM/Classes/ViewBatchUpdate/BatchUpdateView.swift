//
//  BatchUpdateView.swift
//  PowerTools
//
//  Created by Andrea Altea on 26/11/2018.
//

import Foundation

public protocol UpdatableView: UIView {
    
    func forceReload()
}

protocol BatchUpdateView: UpdatableView {
    
    func perform(_ update: ModelUpdate, modelUpdates: () -> Void, completion: ((Bool) -> Void)?)
}
