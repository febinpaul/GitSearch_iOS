//
//  ReposDetailDataSource.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation
import CoreData

class ReposDetailDataSource: DataBaseManager {
    
    var reposProtocol: ReposDetailDataProtocol!
    
    init(reposProtocol: ReposDetailDataProtocol, mainContext: NSManagedObjectContext = CoreData.default.mainManagedObjectContext) {
        self.reposProtocol = reposProtocol
        super.init(context: mainContext)
    }
}

extension ReposDetailDataSource: ReposDetailDataProtocol {
    
    func readAvatar() -> String {
        return self.reposProtocol.readAvatar()
    }
    
    func readOwnerLogin() -> String {
        !self.reposProtocol.readOwnerLogin().isEmpty ? "Owner's Login: " + self.reposProtocol.readOwnerLogin() : Strings.empty
    }
    
    func readReposName() -> String {
        return self.reposProtocol.readReposName()
    }
    
    func readLanguage() -> String {
        !self.reposProtocol.readLanguage().isEmpty ? "Language: " + self.reposProtocol.readLanguage() : Strings.empty
    }
    
    func readNumberOfStar() -> Int {
        return self.reposProtocol.readNumberOfStar()
    }
    
    func readCreatedDate() -> String {
        !self.reposProtocol.readCreatedDate().isEmpty ? "Created Date: " + self.reposProtocol.readCreatedDate() : Strings.empty
    }
    
    func readMarkedRepos() -> GitRepositoryMarkedProtocol? {
        return self.fetchDatabaseRepositoryMarked()?.first
    }
    
    func updateMarkedRepos(withStatus statue: Bool?) {
        if let statusFlag = statue {
            self.createDatabaseRepositoryMarked(withLike: statusFlag)
        }
        else {
            self.deleteDatabaseRepositoryMarked()
        }
    }
    
    func readReposId() -> String {
        return self.reposProtocol.readReposId()
    }
}
