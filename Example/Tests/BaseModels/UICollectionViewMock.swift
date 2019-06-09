//
//  MockCollection.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class UICollectionViewMock: UICollectionView {
    
    var supplementaryViews: [String: UICollectionReusableView] = [:]
    var cell: UICollectionViewCell!
    
    override func dequeueReusableCell(withReuseIdentifier identifier: String,
                                      for indexPath: IndexPath) -> UICollectionViewCell {
        return cell
    }
    
    override func dequeueReusableSupplementaryView(ofKind elementKind: String,
                                                   withReuseIdentifier identifier: String,
                                                   for indexPath: IndexPath) -> UICollectionReusableView {
        return supplementaryViews[elementKind]!
    }
}
