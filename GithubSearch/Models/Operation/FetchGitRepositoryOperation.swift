//
//  FetchGitRepositoryOperation.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

protocol FetchGitRepositoryOperationDelegate: class {
    func fetchGitRepositoryOperationCompleted(syncResult: SyncResult)
}

enum Status {
    case fail
    case success
}

struct SyncResult {
    var dataResult: SearchRepository?
    var status: Status
    var message: String?
}


class FetchGitRepositoryOperation: Operation {
    
    var searchText: String!
    var pageIndex: Int!
    var pagecount: Int!
    weak var delegate: FetchGitRepositoryOperationDelegate?
    
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isFinished: Bool {
        return _finished
    }
    
    func executing(_ executing: Bool) {
        _executing = executing
    }
    
    func finish(_ finished: Bool) {
        _finished = finished
    }
    
    init(searchText: String, pageIndex: Int, pagecount: Int) {
        self.searchText = searchText
        self.pageIndex = pageIndex
        self.pagecount = pagecount
    }
    
    override func main() {
        if isCancelled {
            return
        }
        self.syncDataToServer()
    }
    
    func syncDataToServer() {
        GitReposService().getGitRepositoryList(searchText: self.searchText, pageIndex: self.pageIndex, pageCount: self.pagecount) { (searchRepository, error) in
            self.finish(true)
            guard !self.isCancelled else { return }
            var syncResult = SyncResult(dataResult: nil, status: .fail)
            if let data = searchRepository {
                syncResult.dataResult = data
                syncResult.status = .success
            }
            else {
                syncResult.dataResult = nil
                syncResult.status = .fail
                syncResult.message = error
            }
            DispatchQueue.main.async {
                self.delegate?.fetchGitRepositoryOperationCompleted(syncResult: syncResult)
            }
        }
    }

}
