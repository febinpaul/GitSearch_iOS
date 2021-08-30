//
//  FetchGitRepositoryOperator.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

class FetchGitRepository: FetchGitRepositoryOperator {
    
    static let sharedInstance = FetchGitRepository()
    
    func searchRepositoryAPIService(searchText: String, pageIndex: Int, pageCount: Int, delegate: FetchGitRepositoryOperationDelegate) {
        self.getSearchRepository(searchText: searchText, pageIndex: pageIndex, pageCount: pageCount, delegate: delegate)
    }
}

class FetchGitRepositoryOperator {
    
    lazy var fetchRepositoryQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Sync Data queue"
        queue.maxConcurrentOperationCount = 3
        return queue
    }()
    
    func cancelAllOperation() {
        self.fetchRepositoryQueue.cancelAllOperations()
    }
    
    fileprivate func getSearchRepository(searchText: String, pageIndex: Int, pageCount: Int, delegate: FetchGitRepositoryOperationDelegate) {
        let getSearchRepositoryOperation = FetchGitRepositoryOperation(searchText: searchText, pageIndex: pageIndex, pagecount: pageCount)
        getSearchRepositoryOperation.delegate = delegate
        self.fetchRepositoryQueue.addOperation(getSearchRepositoryOperation)
    }
}
