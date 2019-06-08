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
            guard ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil else { return }
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in

                self?.loadContent(count % 11 == 0)
                count += 1
            }
        }
    }

    private func setupCollection() {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionController = GridCollectionViewController(collectionViewLayout: layout)
        collectionController.attach(to: self)
        collectionController.interactionDelegate = self
        collectionController.forceReload = true
        self.collectionViewController = collectionController
    }

    private func registerCell() {

        self.collectionViewController.register(ColorCollectionViewCell.nibIdentifier)
    }

    private func loadContent(_ wide: Bool) {

        var section = self.collectionViewController.model.first as? BaseSection ?? BaseSection()
        let newItem = ColorViewModel(descriptor: ColorCollectionViewCell.Descriptor(wide: wide), color: .red)
        section.items.insert(newItem, at: 0)
        let newContent = [section]
        self.collectionViewController.update(model: newContent)
    }
}

extension CollectionController: InteractionFactory {
    
    var context: String {
        return self.title ?? "Unknown"
    }
}
