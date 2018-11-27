//
//  ModelUpdate.swift
//  PowerTools
//
//  Created by Andrea Altea on 26/11/2018.
//

import Foundation

internal struct ModelUpdate {

    internal enum Change {
        
        case insert(newPosition: IndexPath)
        case move(oldPosition: IndexPath, newPosition: IndexPath)
        case delete(oldPosition: IndexPath)
    }

    let model: [SectionViewModel]
    let change: [Change]?
    
    init(from oldModel: [SectionViewModel], to newModel: [SectionViewModel], forceReload reloadData: Bool = false) {
        
        self.model = newModel
        
        if reloadData || newModel.shouldReload(from: oldModel) {
            self.change = nil
            return
        }
        
        let oldLookupTable = oldModel.lookupTable
        var countTable: [Int : Int] = [:]
        var changes: [Change] = []
        newModel.forEachItem { (item, section, indexPath) in
            
            let itemIndex = countTable[item.hashValue] ?? 0
            countTable[item.hashValue] = itemIndex + 1
            
            guard let oldItemPositions = oldLookupTable[item.hashValue],
                oldItemPositions.indices.contains(itemIndex) else {
                    changes.append(.insert(newPosition: indexPath))
                    return
            }
            
            let oldIndexPath = oldItemPositions[itemIndex]
            if oldIndexPath != indexPath {
                changes.append(.move(oldPosition: oldIndexPath, newPosition: indexPath))
            }
        }
        
        oldLookupTable.forEach { (itemReference, positions) in
            
            var itemCount = countTable[itemReference] ?? 0
            while itemCount < positions.count {
                changes.append(.delete(oldPosition: positions[itemCount]))
                itemCount += 1
            }
        }
        self.change = changes
    }
}

extension ModelUpdate.Change {
    
    var description: String {
        switch self {
        case .insert(let newPosition):
            return "nil -> \(newPosition.description)"
            
        case .move(let oldPosition, let newPosition):
            return "\(oldPosition) -> \(newPosition)"
            
        case .delete(let oldPosition):
            return "\(oldPosition) -> nil"
        }
    }
}

internal extension Array where Element == SectionViewModel {
    
    var lookupTable: [Int : [IndexPath]] {
     
        var table: [Int : [IndexPath]] = [:]
        self.forEachItem { (item, section, indexPath) in
            
            guard table[item.hashValue] != nil else {
                table[item.hashValue] = [indexPath]
                return
            }
            table[item.hashValue]?.append(indexPath)
        }
        return table
    }
    
    func shouldReload(from oldModel: [SectionViewModel]) -> Bool {
        
        guard oldModel.count == self.count else {
            return true
        }
        
        let firstChange = oldModel.enumerated().first { (index, section) -> Bool in
            
            let newSection = self[index]
            return section.header?.hashValue != newSection.header?.hashValue || section.footer?.hashValue != newSection.footer?.hashValue
        }
        return firstChange != nil
    }
}
