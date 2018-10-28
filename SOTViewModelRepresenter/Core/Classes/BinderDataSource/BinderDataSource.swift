//
//  BinderDataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

class BinderDataSource<View: UIView>: NSObject {
    
    var model: [SectionViewModel]
    
    weak var view: View?
    
    init(view: View, model: [SectionViewModel] = []) {
        self.view = view
        self.model = model
    }
}
