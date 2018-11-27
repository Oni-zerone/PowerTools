//
//  GridCollectionViewController+DataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 09/11/2018.
//

import Foundation

public extension GridCollectionViewController {
    
    public var model: [SectionViewModel] {
        set {
            self.dataSource?.model = newValue
        }
        get {
            return self.dataSource?.model ?? []
        }
    }
    
    public var interactionDelegate: InteractionDelegate? {
        set {
            self.dataSource?.interactionDelegate = newValue
        }
        get {
            return self.dataSource?.interactionDelegate
        }
    }
    
    public var scrollViewDelegate: UIScrollViewDelegate? {
        set {
            self.dataSource?.scrollViewDelegate = newValue
        }
        get {
            return self.dataSource?.scrollViewDelegate
        }
    }
    
    public func update(model newModel: [SectionViewModel]) {
        
        self.dataSource?.update(model: newModel, forceReload: self.forceReload)
    }
}
