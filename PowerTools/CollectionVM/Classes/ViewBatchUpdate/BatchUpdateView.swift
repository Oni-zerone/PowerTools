//
//  BatchUpdateView.swift
//  PowerTools
//
//  Created by Andrea Altea on 26/11/2018.
//

import Foundation

protocol BatchUpdateView {
    
    func perform(_ update: ModelUpdate, modelUpdates: () -> Void, completion: ((Bool) -> Void)?)
}
