//
//  SizedItem.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public protocol SizedItem {
    
    func size(for view: UIView, in containerView: UIView, module: SizeModule) -> CGSize
}
