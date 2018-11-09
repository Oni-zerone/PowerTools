//
//  BinderDataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

open class BinderDataSource<View: UIView>: NSObject {
    
    private var modelStorage: [SectionViewModel]
    
    public weak var view: View?
    
    public init(view: View, model: [SectionViewModel] = []) {
        self.view = view
        self.modelStorage = model
    }
    
    public var model: [SectionViewModel] {
        set {
            self.updateModel(newValue)
        }
        get {
            return self.modelStorage
        }
    }
    
    public func updateModel(_ model: [SectionViewModel]) {
        self.modelStorage = model
    }
}
