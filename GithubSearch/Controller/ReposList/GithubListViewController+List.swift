//
//  GithubListViewController+List.swift
//  GithubSearch
//
//  Created by Febin Paul on 28/08/21.
//

import Foundation
import UIKit

extension GithubListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manager.searchRepository?.arrayItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! GithubListCell
        cell.configCell(data: self.manager.searchRepository, index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let fetchedItemCount = self.manager.searchRepository?.arrayItems, let totalItem = self.manager.searchRepository?.totalCount {
            if indexPath.row == fetchedItemCount.count - 1 && totalItem > fetchedItemCount.count {
                self.getNextPageRepository()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedGitRepos = self.manager.getGitReposOnIndex(indexPath.row) {
            let githubReposDetailViewController = GithubReposDetailViewController(managerProtocol: ReposDetailDataSource(reposProtocol: selectedGitRepos))
            self.navigationController?.pushViewController(githubReposDetailViewController, animated: true)
        }
    }
    
    @objc func paginateReposList() {
        self.tableView.tableFooterView = nil
        self.tableView.tableFooterView?.isHidden = true
    }
}
