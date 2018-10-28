//
//  SectionViewModel.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public protocol SectionViewModel {
    
    var header: ItemViewModel? { get }
    
    var items: [ItemViewModel] { get }
    
    var footer: ItemViewModel? { get }
    
    func model(for elementOfKind: String) -> ItemViewModel?
}

public extension SectionViewModel {
    
    public func model(for elementOfKind: String) -> ItemViewModel? {
        
        switch elementOfKind {
        case UICollectionElementKindSectionHeader:
            return self.header
            
        case UICollectionElementKindSectionFooter:
            return self.footer
            
        default:
            return nil
        }
    }
}
