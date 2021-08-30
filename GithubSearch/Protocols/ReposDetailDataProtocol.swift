//
//  ReposDetailDataProtocol.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

protocol ReposDetailDataProtocol {
    
    var reposDetailOwnername: String { get set }
    var reposDetailCreatedDate: Date { get set }
    var reposDetailName: String { get set }
    var reposDetailStars: Int { get set }
    var reposDetailLanguage: String { get set }
    var reposDetailAvatar: String { get set }
    var reposDetailId: Int { get set }
    
    func readAvatar() -> String
    func readOwnerLogin() -> String
    func readReposName() -> String
    func readLanguage() -> String
    func readNumberOfStar() -> Int
    func readCreatedDate() -> String
    func readReposId() -> String
    func readMarkedRepos() -> GitRepositoryMarkedProtocol?
    func updateMarkedRepos(withStatus statue: Bool?)
}

extension ReposDetailDataProtocol {
    
    var reposDetailOwnername: String {
        get { return Strings.empty } set {}
    }
    
    var reposDetailCreatedDate: Date {
        get { return Date() } set {}
    }
    
    var reposDetailName: String {
        get { return Strings.empty } set {}
    }
    
    var reposDetailStars: Int {
        get { return 0 } set {}
    }
    
    var reposDetailLanguage: String {
        get { return Strings.empty } set {}
    }
    
    var reposDetailAvatar: String {
        get { return Strings.empty } set {}
    }
    
    var reposDetailId: Int {
        get { return 0 } set {}
    }
    
    func readMarkedRepos() -> GitRepositoryMarkedProtocol? {
        return nil
    }
    
    func readReposId() -> Int {
        return 0
    }
    
    func updateMarkedRepos(withStatus statue: Bool?) {}
}
