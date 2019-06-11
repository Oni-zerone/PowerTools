//
//  GridCollectionDataSource+Internal.swift
//  PowerTools
//
//  Created by Andrea Altea on 22/05/2019.
//

import Foundation

internal extension GridCollectionDataSource {
    
    func module(for section: Int, in collection: UICollectionView) -> GridModule? {
        
        if let module = self.moduleCache[section] {
            return module
        }
        
        guard self.model.indices.contains(section),
            let sectionViewModel = self.model[section] as? GridSection else {
                return nil
        }
        let module = sectionViewModel.module(for: collection)
        self.moduleCache[section] = module
        return module
    }
    
    func referenceSizeOf(elementOfKind kind: String, for section: Int, in collectionView: UICollectionView) -> CGSize {
        
        guard let module = self.module(for: section, in: collectionView),
            let header = self.model.viewModel(ofKind: kind, section: section) as? GridItem else {
                return .zero
        }
        return header.size(in: collectionView, module: module)
    }
}
