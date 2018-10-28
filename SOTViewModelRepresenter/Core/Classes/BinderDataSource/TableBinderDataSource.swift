//
//  TableBinderDataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 28/10/18.
//

import UIKit

open class TableBinderDataSource: BinderDataSource<UITableView>, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {

        return self.model.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard self.model.indices.contains(section) else {
            return 0
        }
        return self.model[section].items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.model[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath)
        model.setup(cell, in: tableView, at: indexPath)
        return cell
    }
}
