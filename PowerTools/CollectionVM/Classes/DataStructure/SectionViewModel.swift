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

public extension Array where Element == SectionViewModel {
    
    public func viewModel(at indexPath: IndexPath) -> ItemViewModel? {
        return self.item(at: indexPath.section)?.items.item(at: indexPath.item)
    }
    
    public func viewModel(ofKind kind: String, section: Int) -> ItemViewModel? {
        return self.item(at: section)?.model(for: kind)
    }
}
