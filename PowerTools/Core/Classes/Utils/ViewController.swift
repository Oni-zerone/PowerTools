//
//  ViewController.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 09/11/2018.
//

import UIKit

public extension UIViewController {
    
    public func attach(to parentVC: UIViewController, in view: UIView? = nil) {
        
        guard let containerView = view ?? parentVC.view else {
            return
        }
        
        self.willMove(toParent: parentVC)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(self.view)
        parentVC.addChild(self)

        self.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        self.view.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        self.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        self.view.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        self.didMove(toParent: parentVC)
    }
}
