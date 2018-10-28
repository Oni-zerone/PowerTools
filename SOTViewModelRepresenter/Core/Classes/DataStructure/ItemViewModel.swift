//
//  ItemViewModel.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import Foundation

public protocol ItemViewModel {
    
    var reuseIdentifier: String { get }
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath)
}
