//
//  DataBaseManager.swift
//  GithubSearch
//
//  Created by Febin on 27/08/21.
//

import Foundation
import CoreData

class DataBaseManager {
    
    init(context: NSManagedObjectContext) {
        self.mainObjectContext = context
    }
    
    func readRecords(fromCoreData tableName: String, predicate: NSPredicate? = nil, sortDescriptor: [String]? = nil, ascending: Bool = true, limit: Int = 0) -> [Any] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entity = NSEntityDescription.entity(forEntityName: tableName, in: self.mainObjectContext)
        fetchRequest.entity = entity
        fetchRequest.returnsObjectsAsFaults = false
        if predicate != nil {
            fetchRequest.predicate = predicate
        }
        if let sortkeys = sortDescriptor {
            var sortedItems: [NSSortDescriptor] = []
            for key in sortkeys {
                let sortDescriptor = NSSortDescriptor(key: key, ascending: ascending)
                sortedItems.append(sortDescriptor)
            }
            fetchRequest.sortDescriptors = sortedItems
        }
        if limit != 0 {
            fetchRequest.fetchLimit = limit
        }
        do {
            let records: [Any] = try self.mainObjectContext.fetch(fetchRequest)
            return records
        } catch  {
            assert(true, error.localizedDescription)
        }
        return []
    }
    
    func insertNewRecords(_ tableName: String) -> Any? {
        let table: Any? = NSEntityDescription.insertNewObject(forEntityName: tableName, into: self.mainObjectContext)
        return table
    }
    
    lazy var mainObjectContext: NSManagedObjectContext = {
        return CoreData.default.mainManagedObjectContext
    }()
}
