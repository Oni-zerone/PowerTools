//
//  MockCollection.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 08/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
// swiftlint:disable identifier_name
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
    
    public var registerNibForCellWithReuseIdentifierCallsCount = 0
    public var registerNibForCellWithReuseIdentifierCalled: Bool {
        return registerNibForCellWithReuseIdentifierCallsCount > 0
    }
    public var registerNibForCellWithReuseIdentifierReceivedArguments: (nib: UINib?, identifier: String)?
    public var registerNibForCellWithReuseIdentifierReceivedInvocations: [(nib: UINib?, identifier: String)] = []
    public var registerNibForCellWithReuseIdentifierClosure: ((UINib?, String) -> Void)?
    
    override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        registerNibForCellWithReuseIdentifierCallsCount += 1
        registerNibForCellWithReuseIdentifierReceivedArguments = (nib: nib, identifier: identifier)
        registerNibForCellWithReuseIdentifierReceivedInvocations.append((nib: nib, identifier: identifier))
        registerNibForCellWithReuseIdentifierClosure?(nib, identifier)
    }
}
// swiftlint:enable identifier_name
