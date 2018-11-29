//
//  ColorViewModel.swift
//  SOTViewModelRepresenter_Example
//
//  Created by Andrea Altea on 09/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import PowerTools

protocol ColorView {

    func setup(color: UIColor)
}

class ColorViewModel: NSObject, ItemViewModel, GridItem {
    
    var descriptor: ItemViewDescriptor

    let color: UIColor

    init(descriptor: ItemViewDescriptor, color: UIColor) {
        
        self.descriptor = descriptor
        self.color = color
    }
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {

        if let colorView = view as? ColorView {
            colorView.setup(color: self.color)
        }
    }
}

class ControllerBuilder: Builder<String> {
    
    let color: UIColor
    
    init(color: UIColor) {
        self.color = color
        super.init()
    }
    
    override func build(_ parameters: String) -> UIViewController? {
        
        let controller = UIViewController()
        controller.view.backgroundColor = self.color
        controller.title = parameters
        return controller
    }
}

extension ColorViewModel: BuilderContainer {
    
    func getBuilder<Parameters>(_ parametersType: Parameters.Type) -> Builder<Parameters>? {

        return ControllerBuilder(color: self.color) as? Builder<Parameters>
    }
}
