//
//  BaseSection.swift
//  SOTViewModelRepresenter_Example
//
//  Created by Andrea Altea on 09/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import PowerTools

struct BaseSection: SectionViewModel {

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

extension BaseSection: GridSection {

    var lineItems: Int? {
        return 3
    }

    var sectionHorizontalItemSpacing: CGFloat {
        return 16.0
    }

    var sectionVerticalItemSpacing: CGFloat {
        return 8.0
    }

    var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}
