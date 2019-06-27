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
    
    init(from oldModel: [SectionViewModel], to newModel: [SectionViewModel], forceReload: Bool = false) {
        
        self.model = newModel
        
        if forceReload || newModel.shouldReload(from: oldModel) {
            self.change = nil
            return
        }
        
        let oldLookupTable = oldModel.lookupTable
        var countTable: [Int : Int] = [:]
        var changes: [Change] = []
        newModel.forEachItem { (item, section, indexPath) in
            
            let occurrence = countTable[item.hashValue] ?? 0
            countTable[item.hashValue] = occurrence + 1
            
            let change = oldLookupTable.calculateChange(of: item, occurrence: occurrence, indexPath: indexPath)
            changes.append(change)
        }
        
        let deletions = oldLookupTable.calculateDeletions(countTable: countTable)
        changes.append(contentsOf: deletions)
        self.change = changes
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

fileprivate extension Dictionary where Key == Int, Value == [IndexPath] {
    
    func calculateChange(of item: ItemViewModel, occurrence: Int, indexPath: IndexPath) -> ModelUpdate.Change? {
        
        guard let oldPositions = self[item.hashValue],
            oldPositions.indices.contains(occurrence) else {
                return .insert(newPosition: indexPath)
        }
        
        let oldIndexPath = oldPositions[occurrence]
        if oldIndexPath != indexPath {
            return .move(oldPosition: oldIndexPath, newPosition: indexPath)
        }
        
        return nil
    }
    
    func calculateDeletions(countTable: [Int : Int]) -> [ModelUpdate.Change] {
        
        var changes: [ModelUpdate.Change] = []
        self.forEach { (itemReference, positions) in
            
            var itemCount = countTable[itemReference] ?? 0
            while itemCount < positions.count {
                changes.append(.delete(oldPosition: positions[itemCount]))
                itemCount += 1
            }
        }
        return changes
    }
}
