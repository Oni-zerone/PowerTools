//
//  SectionViewModel.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public protocol SectionViewModel {
    
    var header: ItemViewModel? { get set }
    
    var items: [ItemViewModel] { get set }
    
    var footer: ItemViewModel? { get set }
    
    func model(for elementOfKind: String) -> ItemViewModel?
}

public extension SectionViewModel {
    
    func model(for elementOfKind: String) -> ItemViewModel? {
        
        switch elementOfKind {
        case UICollectionView.elementKindSectionHeader:
            return self.header
            
        case UICollectionView.elementKindSectionFooter:
            return self.footer
            
        default:
            return nil
        }
    }
}

public extension Array where Element == SectionViewModel {
    
    func viewModel(at indexPath: IndexPath) -> ItemViewModel? {
        return self.item(at: indexPath.section)?.items.item(at: indexPath.item)
    }
    
    func viewModel(ofKind kind: String, section: Int) -> ItemViewModel? {
        return self.item(at: section)?.model(for: kind)
    }
    
    func forEachItem(action: (_ item: ItemViewModel, _ section: SectionViewModel, _ indexPath: IndexPath) -> Void) {
        
        self.enumerated().forEach { (sectionIndex, section) in
            section.items.enumerated().forEach { (itemIndex, item) in
                action(item, section, IndexPath(item: itemIndex, section: sectionIndex))
            }
        }
    }
}
