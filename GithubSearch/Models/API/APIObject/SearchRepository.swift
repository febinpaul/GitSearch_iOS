//
//  SearchRepository.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

class SearchRepository: SearchRepositoryProtocol {
    
    var totalCount: Int = 0
    var arrayItems: [ReposDetailDataProtocol] = []
    
    init(reposJsonData: [String: Any]) {
        self.totalCount = reposJsonData["total_count"] as? Int ?? 0
        if let items = reposJsonData["items"] as? [[String: Any]] {
            self.arrayItems = items.map({ GitRepository(reposJsonData: $0) })
        }
    }
}
