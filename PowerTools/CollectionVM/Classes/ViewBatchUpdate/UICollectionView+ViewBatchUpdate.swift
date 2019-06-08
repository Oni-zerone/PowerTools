//
//  UICollectionView+BatchUpdateView.swift
//  PowerTools
//
//  Created by Andrea Altea on 26/11/2018.
//

import UIKit

extension UICollectionView: UpdatableView {

    public func forceReload() {
        self.reloadData()
    }
}

extension UICollectionView: BatchUpdateView {
    
    func perform(_ update: ModelUpdate, modelUpdates: () -> Void, completion: ((Bool) -> Void)?) {
        
        guard let changes = update.change else {
            modelUpdates()
            self.reloadData()
            completion?(true)
            return
        }
        
        self.performBatchUpdates({
            modelUpdates()
            changes.forEach({ (change) in
                self.perform(change)
            })
        }, completion: completion)
    }
    
    internal func perform(_ change: ModelUpdate.Change) {
        
        switch change {
            
        case .delete(let position):
            self.deleteItems(at: [position])
            
        case .insert(newPosition: let position):
            self.insertItems(at: [position])
            
        case .move(let oldPosition, let newPosition):
            self.moveItem(at: oldPosition, to: newPosition)
        }
    }
}
