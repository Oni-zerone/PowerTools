//
//  ViewController.swift
//  SOTViewModelRepresenter
//
//  Created by acct<blob>=<NULL> on 10/28/2018.
//  Copyright (c) 2018 acct<blob>=<NULL>. All rights reserved.
//

import UIKit
import SOTViewModelRepresenter

class CollectionController: UIViewController {

    weak var collectionViewController: SizedCollectionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupCollection()
        self.registerCell()
        
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (timer) in
                self?.loadContent()
            }
        }
    }
    
    private func setupCollection() {
        
        let collectionController = SizedCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        collectionController.attach(to: self)
        self.collectionViewController = collectionController
    }
    
    private func registerCell() {
        
        self.collectionViewController.register(ColorCollectionViewCell.nibIdentifier)
    }
    
    private func loadContent() {
        
        var section = self.collectionViewController.model.first as? GridSection ?? GridSection()
        section.append(ColorViewModel(descriptor: ColorCollectionViewCell.Descriptor(), color: .red))
        let newContent = [section]
        self.collectionViewController.model = newContent
    }
}
