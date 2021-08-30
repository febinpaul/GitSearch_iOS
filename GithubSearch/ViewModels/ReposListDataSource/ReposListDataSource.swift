//
//  ReposListDataSource.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

protocol ReposListDataSourceDelegate: class {
    func updateListData()
}

class ReposListDataSource {
    
    var currentSearchRepository: SearchRepositoryProtocol?
    var serverMessage: String = Strings.empty
    private var currentPageIndex: Int = 1
    private var currentSearchText: String = Strings.empty
    weak var reposListDataSourceDelegate: ReposListDataSourceDelegate?
    
    init() {}
}


extension ReposListDataSource: ReposListDataProtocol {
    
    func getGitReposOnIndex(_ index: Int) -> ReposDetailDataProtocol? {
        return self.currentSearchRepository?.arrayItems[index]
    }
    
    
    var serviceSearchText: String {
        get {
            return self.currentSearchText
        }
        set {
            self.currentSearchText = newValue
        }
    }
    
    var servicePageIndex: Int {
        get {
            return self.currentPageIndex
        }
        set {
            self.currentPageIndex = newValue
        }
    }
    
    var delegate: ReposListDataSourceDelegate? {
        get {
            self.reposListDataSourceDelegate
        }
        set {
            self.reposListDataSourceDelegate = newValue
        }
    }
    
    var currentItemCount: Int {
        return self.currentSearchRepository?.arrayItems.count ?? 0
    }
    
    var totalCount: Int {
        return self.currentSearchRepository?.totalCount ?? 0
    }
    
    var searchRepository: SearchRepositoryProtocol? {
        get {
            return self.currentSearchRepository
        }
    }
    
    func containsReposItems() -> Bool {
        guard let repos = self.currentSearchRepository else { return false }
        return !repos.arrayItems.isEmpty
    }
    
    func restSearchData() {
        self.servicePageIndex = 1
        self.currentSearchRepository = nil
        self.reposListDataSourceDelegate?.updateListData()
    }
    
    func cancelAllOperation() {
        FetchGitRepository.sharedInstance.cancelAllOperation()
    }
    
    func readServerMessage() -> String {
        return self.serverMessage
    }
    
    internal func getDataSourceSearchRepository() {
        FetchGitRepository.sharedInstance.searchRepositoryAPIService(searchText: self.currentSearchText, pageIndex: self.currentPageIndex, pageCount: 15, delegate: self)
    }
    
    func findRepositoryList(ofString text: String) {
        self.serviceSearchText = text
        self.servicePageIndex = 1
        self.getDataSourceSearchRepository()
    }
    
    func findNextPageRepositoryList() {
        self.servicePageIndex += 1
        self.getDataSourceSearchRepository()
    }
}


