//
//  GitRepository.swift
//  GithubSearch
//
//  Created by Febin Paul on 28/08/21.
//

import Foundation

class GitRepository {
    
    var ownerLogin: String! = Strings.empty
    var creationDate: Date?
    var reposName: String!
    var numberOfStars: Int
    var language: String?
    var ownerAvatar: String?
    var id: String! = Strings.empty
    
    init(reposJsonData: [String: Any]) {
        if let ownerDict = reposJsonData["owner"] as? [String: Any] {
            self.ownerLogin = ownerDict["login"] as? String
            self.ownerAvatar = ownerDict["avatar_url"] as? String
        }
        if let reposId = reposJsonData["id"] as? Int {
            self.id = String(reposId)
        }
        if let stringDate = reposJsonData["created_at"] as? String {
            self.creationDate = stringDate.stringTodate(in: DateFormatters.yyyySMMSddTHHCmmCssZ)
        }
        self.reposName = reposJsonData["name"] as? String
        self.numberOfStars = reposJsonData["stargazers_count"] as? Int ?? 0
        self.language = reposJsonData["language"] as? String
    }
}

extension GitRepository: ReposDetailDataProtocol {
    
    func readAvatar() -> String {
        return self.ownerAvatar ?? Strings.empty
    }
    
    func readOwnerLogin() -> String {
        return self.ownerLogin
    }
    
    func readNumberOfStar() -> Int {
        return numberOfStars
    }
    
    func readCreatedDate() -> String {
        return creationDate?.convertStringToFormat(DateFormatters.ddHMMHyyy) ?? Strings.empty
    }
    
    func readReposId() -> String {
        return self.id
    }
    
    func readReposName() -> String {
        return self.reposName
    }
    
    func readLanguage() -> String {
        return self.language ?? Strings.empty
    }
}
