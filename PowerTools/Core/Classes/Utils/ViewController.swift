//
//  ViewController.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 09/11/2018.
//

import UIKit

public extension UIViewController {
    
    func attach(to parentVC: UIViewController,
                       in view: UIView? = nil,
                       position: UIView.AttachPosition = .fill) {
        
        guard let containerView = view ?? parentVC.view else {
            return
        }
        
        self.willMove(toParent: parentVC)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(self.view)
        parentVC.addChild(self)

        containerView.attach(view: self.view, in: position)
        self.didMove(toParent: parentVC)
    }
}
