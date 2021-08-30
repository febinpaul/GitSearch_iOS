//
//  GithubListViewController+Callback.swift
//  GithubSearch
//
//  Created by Febin Paul on 28/08/21.
//

import Foundation
import UIKit

extension GithubListViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.manager.cancelAllOperation()
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.searchGithubRepos), userInfo: nil, repeats: false)
    }
    
    @objc func searchGithubRepos() {
        guard let query = self.searchBar.text else { return }
        if query == "" { self.resetSearchData(); return }
        self.getSearchRepository(searchText: query)
    }
}

extension GithubListViewController: ReposListDataSourceDelegate {
    func updateListData() {
        self.updateTableList()
    }
}
