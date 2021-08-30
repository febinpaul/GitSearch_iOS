//
//  ReposListDataProtocol.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

protocol ReposListDataProtocol {
    var searchRepository: SearchRepositoryProtocol? { get }
    var delegate: ReposListDataSourceDelegate? { get set }
    func cancelAllOperation()
    func restSearchData()
    func containsReposItems() -> Bool
    func getGitReposOnIndex(_ index: Int) -> ReposDetailDataProtocol?
    func readServerMessage() -> String
    func findRepositoryList(ofString text: String)
    func findNextPageRepositoryList()
}
