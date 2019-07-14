//
//  SectionViewModel.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

public protocol SectionViewModel: AnySectionViewModel {
    associatedtype AItemViewModel: ItemViewModel
    
    var header: AItemViewModel? { get set }
    
    var items: [AItemViewModel] { get set }
    
    var footer: AItemViewModel? { get set }
    
    func model(for elementOfKind: String) -> AItemViewModel?
}

public extension SectionViewModel {
    
    func model(for elementOfKind: String) -> AItemViewModel? {
        
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

public extension Array where Element: SectionViewModel {
    
    func viewModel(at indexPath: IndexPath) -> ItemViewModel? {
        return self.item(at: indexPath.section)?.items.item(at: indexPath.item)
    }
    
    func viewModel(ofKind kind: String, section: Int) -> ItemViewModel? {
        return self.item(at: section)?.model(for: kind)
    }
    
    func forEachItem(action: (_ item: Element.AItemViewModel, _ section: Element, _ indexPath: IndexPath) -> Void) {
        
        self.enumerated().forEach { (arg) in
            let (sectionIndex, section) = arg
            section.items.enumerated().forEach { (arg) in
                let (itemIndex, item) = arg
                action(item, section, IndexPath(item: itemIndex, section: sectionIndex))
            }
        }
    }
}

public struct AnySectionViewModel: SectionViewModel {
    
    private var erasedSection: Any
    
    init<T: SectionViewModel>(_ section: T) {
        self.erasedSection = section
    }
    
    public var header: AnyItemViewModel? {
        get {
            guard let section = self.erasedSection as! SectionViewModel
                section.header else { return nil }
            return AnyItemViewModel(section)
        }
        set {
            self.erasedSection.header.newSection
        }
    }
    
    var items: [AItemViewModel] { get set }
    
    var footer: AItemViewModel? { get set }

}
