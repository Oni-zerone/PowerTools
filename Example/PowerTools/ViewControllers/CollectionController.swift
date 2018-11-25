//
//  ViewController.swift
//  SOTViewModelRepresenter
//
//  Created by acct<blob>=<NULL> on 10/28/2018.
//  Copyright (c) 2018 acct<blob>=<NULL>. All rights reserved.
//

import UIKit
import PowerTools

class CollectionController: UIViewController {

    weak var collectionViewController: GridCollectionViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupCollection()
        self.registerCell()

        var count: Int = 1
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in

                self?.loadContent(count % 10 == 0)
                count += 1
            }
        }
    }

    private func setupCollection() {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionController = GridCollectionViewController(collectionViewLayout: layout)
        collectionController.attach(to: self)
        self.collectionViewController = collectionController
    }

    private func registerCell() {

        self.collectionViewController.register(ColorCollectionViewCell.nibIdentifier)
    }

    private func loadContent(_ wide: Bool) {

        var section = self.collectionViewController.model.first as? BaseSection ?? BaseSection()
        section.append(ColorViewModel(descriptor: ColorCollectionViewCell.Descriptor(wide: wide), color: .red))
        let newContent = [section]
        self.collectionViewController.model = newContent
    }
}
