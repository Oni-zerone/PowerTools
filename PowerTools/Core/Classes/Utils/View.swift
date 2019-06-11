//
//  View.swift
//  PowerTools
//
//  Created by Andrea Altea on 29/11/2018.
//

import UIKit

public extension UIView {
    
    enum AttachPosition {
        
        case fill
        case top
        case right
        case left
        case bottom
    }
    
    func attach(view: UIView,  in position: AttachPosition) {
        
        self.verticalAttach(view: view, in: position)
        self.horizonalAttach(view: view, in: position)
    }
    
    private func verticalAttach(view: UIView, in position: AttachPosition) {
        
        if position != .right {
            self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        }
        
        if position != .left {
            self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }
    }
    
    private func horizonalAttach(view: UIView, in position: AttachPosition) {

        if position != .top {
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
        if position != .bottom {
            self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }

    }
}
