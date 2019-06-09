//
//  CollectionBinderDataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

open class CollectionBinderDataSource: BinderDataSource<UICollectionView>, UICollectionViewDataSource {
    
    override public var view: UICollectionView? {
        didSet {
            oldValue?.dataSource = nil
            self.view?.dataSource = self
        }
    }
    
    override public init(view: UICollectionView?, model: [SectionViewModel]) {
        
        super.init(view: view, model: model)
        view?.dataSource = self
    }
    
    override open var model: [SectionViewModel] {
        didSet {
            self.view?.reloadData()
        }
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return self.model.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let section = self.model.item(at: section) else {
            return 0
        }
        
        return section.items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let model = self.model.viewModel(at: indexPath) else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.reuseIdentifier, for: indexPath)
        model.setup(cell, in: collectionView, at: indexPath)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard let model = self.model.viewModel(ofKind: kind, section: indexPath.section) else {
            return UICollectionReusableView()
        }
        
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: model.reuseIdentifier, for: indexPath)
        model.setup(reusableView, in: collectionView, at: indexPath)
        return reusableView
    }
}
