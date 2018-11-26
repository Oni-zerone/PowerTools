//
//  BinderDataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

open class BinderDataSource<View: UIView>: NSObject {
    
    private let updateQueue = DispatchQueue(label: "Model.update.queue", qos: DispatchQoS.userInitiated)

    private var _model: [SectionViewModel]
    
    open var model: [SectionViewModel] {
        set {
            self.update(model: newValue, forceReload: true)
        }
        get {
            return self._model
        }
    }
    
    public weak var view: View?
    
    public init(view: View, model: [SectionViewModel] = []) {
        self.view = view
        self._model = model
    }
    
    public func update(model newModel: [SectionViewModel], forceReload reloadData: Bool = false) {
        
        guard let batchUpdateView = self.view as? BatchUpdateView else {
            self._model = newModel
            return
        }
        
        self.updateQueue.async {
            
            let oldModel = self._model
            let updates = ModelUpdate(from: oldModel, to: newModel, forceReload: reloadData)
            DispatchQueue.main.sync {
                batchUpdateView.perform(updates, modelUpdates: {
                    self._model = newModel
                }, completion: nil)
            }
        }
    }
}
