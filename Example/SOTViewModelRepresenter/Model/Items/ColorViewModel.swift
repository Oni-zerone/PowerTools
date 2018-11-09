//
//  ColorViewModel.swift
//  SOTViewModelRepresenter_Example
//
//  Created by Andrea Altea on 09/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import SOTViewModelRepresenter

protocol ColorView {
    
    func setup(color: UIColor)
}

struct ColorViewModel: ItemViewModel, SizedItem {

    var descriptor: ItemViewDescriptor

    let color: UIColor
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {
        
        if let colorView = view as? ColorView {
            colorView.setup(color: self.color)
        }
    }
}