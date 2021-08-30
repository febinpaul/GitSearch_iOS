//
//  GitReposService.swift
//  GithubSearch
//
//  Created by Febin Paul on 28/08/21.
//

import Foundation

class GitReposService {
    
    func getGitRepositoryList(searchText: String, pageIndex: Int, pageCount: Int, callback: @escaping(SearchRepository?, String?) ->()) {
        // https://api.github.com/search/repositories?q=tetris&page=1&per_page=10
        var param: [String: String] = [:]
        param["q"] = searchText
        param["page"] = "\(pageIndex)"
        param["per_page"] = "\(pageCount)"
        GitReposServiceCommand().getGitRepositoryList(params: param) { (response, error) in
            guard let result = response else { return callback(nil, Strings.unknownError)}
            if let message = result["message"] as? String, !message.isEmpty {
                callback(nil, message)
            }
            else if let result = response {
                callback(SearchRepository(reposJsonData: result), nil)
            }
        }
    }
}


class GitReposServiceCommand: WSManager {
    
    func getGitRepositoryList(params: [String: Any]?, callback: @escaping ([String: Any]?, String?) -> ()) {
        self.get(endPoint: APIEndpoint.searchRepos, params: params) { (response, error) in
            if let result = response {
                if let data = result.data as? [String: Any] {
                    callback(data, nil)
                }
                else {
                    callback(nil, result.error)
                }
            }
            else {
                callback(nil, error?.message ?? Strings.unknownError)
            }
        }
    }
}
