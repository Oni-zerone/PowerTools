//
//  ViewController.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 09/11/2018.
//

import UIKit

public extension UIViewController {
    
    @available(iOS 9.0, *)
    public func attach(to parentVC: UIViewController, in view: UIView? = nil) {
        
        guard let containerView = view ?? parentVC.view else {
            return
        }
        
        self.willMove(toParentViewController: parentVC)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(self.view)
        parentVC.addChildViewController(self)

        self.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        self.view.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        self.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        self.view.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        self.didMove(toParentViewController: parentVC)
    }
}
