//
//  GridCollectionViewController.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 08/11/2018.
//

import UIKit

private let reuseIdentifier = "Cell"

public class GridCollectionViewController: UICollectionViewController {
    
    public var forceReload: Bool = false
    
    open var dataSource: GridCollectionDataSource? = GridCollectionDataSource(view: nil, model: [])
        
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupDataSource()
    }
    
    internal func setupUI() {
        
        self.view.backgroundColor = UIColor.clear
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.backgroundColor = .clear
        collectionView.backgroundView?.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
    }
    
    internal func setupDataSource() {
        self.dataSource?.view = self.collectionView
    }
}
