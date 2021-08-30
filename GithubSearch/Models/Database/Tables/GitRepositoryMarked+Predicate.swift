//
//  GitRepositoryMarked+Predicate.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

public extension GitRepositoryMarked {
    static func predicateWith(id: String?) -> NSPredicate? {
        guard let reposId = id else {
            return nil
        }
        return NSPredicate(format: "id == %@", reposId)
    }
}
