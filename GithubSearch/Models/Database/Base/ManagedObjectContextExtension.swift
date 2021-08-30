//
//  ManagedObjectContextExtension.swift
//  GithubSearch
//
//  Created by Febin on 27/08/21.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func saveContext() {
        if self.hasChanges {
            do { try self.save() }
            catch {
                print("Ops there was an error \(error.localizedDescription)")
                abort() }
        }
    }
}
