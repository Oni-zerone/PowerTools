//
//  CollectionSizedDataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 29/10/18.
//

import Foundation

class CollectionSizedDataSource: CollectionBinderDataSource, UICollectionViewDelegateFlowLayout {
    
    var moduleCache: [Int: SizeModule] = [:]
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        guard let section = self.model[section] as? SizedSection else {
            return .zero
        }
        return section.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let module = self.module(for: indexPath.section, in: collectionView),
            let sizedItem = self.model.viewModel(at: indexPath) as? SizedItem else {
            return .zero
        }
        
        return sizedItem.size(in: collectionView, module: module)
    }
}

internal extension CollectionSizedDataSource {
    
    func module(for section: Int, in collection: UICollectionView) -> SizeModule? {
        
        if let module = self.moduleCache[section] {
            return module
        }
        
        guard self.model.indices.contains(section),
            let sectionViewModel = self.model[section] as? SizedSection else {
            return nil
        }
        let module = sectionViewModel.module(for: collection)
        self.moduleCache[section] = module
        return module
    }
}
