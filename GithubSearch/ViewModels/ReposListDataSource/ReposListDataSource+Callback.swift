//
//  ReposListDataSource+Callback.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation


extension ReposListDataSource: FetchGitRepositoryOperationDelegate {
    
    func fetchGitRepositoryOperationCompleted(syncResult: SyncResult) {
        switch syncResult.status {
        case .success:
            if self.servicePageIndex > 1 {
                self.currentSearchRepository?.arrayItems.append(contentsOf: syncResult.dataResult?.arrayItems ?? [])
            }
            else {
                self.servicePageIndex = 1
                self.currentSearchRepository = syncResult.dataResult
            }
        case .fail:
            self.currentSearchRepository = nil
            self.serverMessage = (syncResult.message ?? Strings.empty)
        }
        self.reposListDataSourceDelegate?.updateListData()
    }
}
