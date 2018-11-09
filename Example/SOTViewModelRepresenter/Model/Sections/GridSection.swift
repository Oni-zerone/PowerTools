//
//  GridSection.swift
//  SOTViewModelRepresenter_Example
//
//  Created by Andrea Altea on 09/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import SOTViewModelRepresenter

struct GridSection: SectionViewModel {

    var header: ItemViewModel?
    
    var items: [ItemViewModel]
    
    var footer: ItemViewModel?
    
    init(header: ItemViewModel? = nil, items: [ItemViewModel] = [], footer: ItemViewModel? = nil) {
        self.header = header
        self.items = items
        self.footer = footer
    }
    
    mutating func append(_ item: ItemViewModel) {
        self.items.append(item)
    }
}

extension GridSection: SizedSection {
    
    var lineItems: Int? {
        return 3
    }
    
    var sectionInteritemSpacing: CGFloat {
        return 8.0
    }
    
    var sectionInterlineSpacing: CGFloat {
        return 16.0
    }
    
    var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 8.0, left: 4.0, bottom: 8.0, right: 4.0)
    }
}
