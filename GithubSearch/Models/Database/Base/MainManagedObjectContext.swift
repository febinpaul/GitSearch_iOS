//
//  MainManagedObjectContext.swift
//  GithubSearch
//
//  Created by Febin on 27/08/21.
//

import UIKit
import CoreData

class MainManagedObjectContext: NSManagedObjectContext {
    
    override func save() throws {
        try super.save()
        self.saveMasterObjectContext()
    }
    
    func saveMasterObjectContext() {
        if let masterContext = self.parent {
            masterContext.perform { [weak self] in
                guard let _ = self else { return }
                masterContext.saveContext() }
        }
    }
}
