//
//  BinderDataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

open class BinderDataSource<View: UIView>: NSObject {
    
    open var model: [SectionViewModel]
    
    public weak var view: View?
    
    public init(view: View, model: [SectionViewModel] = []) {
        self.view = view
        self.model = model
    }
}
