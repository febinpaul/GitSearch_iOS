//
//  ReposDetailDataSource+DB.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation
import CoreData

extension ReposDetailDataSource {
    
    func createDatabaseRepositoryMarked(withLike status: Bool) {
        var gitRepositoryMarked = self.fetchDatabaseRepositoryMarked()?.first ?? self.insertNewRecords(Entity.gitRepositoryMarked) as? GitRepositoryMarkedProtocol
        gitRepositoryMarked?.id = self.reposProtocol.readReposId()
        gitRepositoryMarked?.isLiked = status
        self.mainObjectContext.saveContext()
    }
    
    func deleteDatabaseRepositoryMarked() {
        if let gitRepositoryMarked = self.fetchDatabaseRepositoryMarked()?.first, let managedObject = gitRepositoryMarked as? NSManagedObject {
            self.mainObjectContext.delete(managedObject)
            self.mainObjectContext.saveContext()
        }
    }
    
    func fetchDatabaseRepositoryMarked() -> [GitRepositoryMarkedProtocol]? {
        if let gitRepositoryMarkedRecords = self.readRecords(fromCoreData: Entity.gitRepositoryMarked, predicate:  GitRepositoryMarked.predicateWith(id: self.reposProtocol.readReposId())) as? [GitRepositoryMarkedProtocol] {
            return gitRepositoryMarkedRecords
        }
        return nil
    }
}

