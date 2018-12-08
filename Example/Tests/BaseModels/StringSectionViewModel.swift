//
//  StringSectionViewModel.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import PowerTools

struct StringSectionViewModel: SectionViewModel, Equatable {
    
    var header: ItemViewModel?
    
    var items: [ItemViewModel]
    
    var footer: ItemViewModel?
    
    static func == (lhs: StringSectionViewModel, rhs: StringSectionViewModel) -> Bool {
        return (lhs.header as? StringViewModel) == (rhs.header as? StringViewModel)
        && (lhs.items as? [StringViewModel]) == (rhs.items as? [StringViewModel])
        && (lhs.footer as? StringViewModel) == (rhs.footer as? StringViewModel)
    }
}

extension String {
    
    var section: StringSectionViewModel {
        let viewModels = self.map { (character) -> StringViewModel in
            return String(character).model
        }
        return StringSectionViewModel(header: nil, items: viewModels, footer: nil)
    }
}
