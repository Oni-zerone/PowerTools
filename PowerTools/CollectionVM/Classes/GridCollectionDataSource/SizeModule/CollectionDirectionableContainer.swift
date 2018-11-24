//
//  CollectionDirectionableContainer.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 29/10/18.
//

import UIKit

extension UICollectionView: DirectionableContainer {
    
    public var contentDirection: ContentDirection {
        
        guard let layout = self.collectionViewLayout as? DirectionableContainer else {
            return .vertical
        }
        return layout.contentDirection
    }
}

extension UICollectionViewFlowLayout: DirectionableContainer {
    
    public var contentDirection: ContentDirection {
        return self.scrollDirection == .vertical ? .vertical : .horizontal
    }
}
