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
    
    func perform<ASectionViewModel: SectionViewModel>(_ update: ModelUpdate<ASectionViewModel>, modelUpdates: () -> Void, completion: ((Bool) -> Void)?)
}
