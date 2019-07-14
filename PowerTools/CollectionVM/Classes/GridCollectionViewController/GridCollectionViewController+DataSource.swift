//
//  GridCollectionViewController+DataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 09/11/2018.
//

import Foundation

public extension GridCollectionViewController {
    
    var model: [ASectionViewModel] {
        set {
            self.dataSource?.model = newValue
        }
        get {
            return self.dataSource?.model ?? []
        }
    }
    
    var interactionDelegate: InteractionDelegate? {
        set {
            self.dataSource?.interactionDelegate = newValue
        }
        get {
            return self.dataSource?.interactionDelegate
        }
    }
    
    var scrollViewDelegate: UIScrollViewDelegate? {
        set {
            self.dataSource?.scrollViewDelegate = newValue
        }
        get {
            return self.dataSource?.scrollViewDelegate
        }
    }
    
    func update(model newModel: [ASectionViewModel]) {
        
        self.dataSource?.update(model: newModel, forceReload: self.forceReload)
    }
}
