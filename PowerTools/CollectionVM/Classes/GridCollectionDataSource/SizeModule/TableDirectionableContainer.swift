//
//  TableDirectionableContainer.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 29/10/18.
//

import UIKit

extension UITableView: DirectionableContainer {
    
    public var contentDirection: ContentDirection {
        return .vertical
    }
}
