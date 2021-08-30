//
//  GithubListViewController+Action.swift
//  GithubSearch
//
//  Created by Febin Paul on 28/08/21.
//

import Foundation
import UIKit

extension GithubListViewController {
    
    func initialAction() {
        self.configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        self.searchBar.sizeToFit()
        self.searchBar.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = Strings.githubSearch
        self.showSearchBarButton(shouldShow: true)
        
        let barHeight: CGFloat = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        self.tableView.frame = CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        let tableDict: [String: Any] = ["tableView": self.tableView, "superview": self.view!]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[tableView]-|", options: [], metrics: nil, views: tableDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[tableView]-|", options: [], metrics: nil, views: tableDict))
        
        self.view.addSubview(self.activityIndicator)
        let activityIndicatorDict: [String: Any] = ["activityIndicator": self.activityIndicator, "superview": self.view!,]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[superview]-(<=0)-[activityIndicator]", options: .alignAllCenterX, metrics: nil, views: activityIndicatorDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[superview]-(<=0)-[activityIndicator]", options: .alignAllCenterY, metrics: nil, views: activityIndicatorDict))
        
        self.view.addSubview(self.labelSearchListTitle)
        let searchListTitleDict: [String: Any] = ["labelSearchListTitle": self.labelSearchListTitle]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[labelSearchListTitle]-0-|", options: [], metrics: nil, views: searchListTitleDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[labelSearchListTitle]-0-|", options: [], metrics: nil, views: searchListTitleDict))
    }
    
    
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        self.showSearchBarButton(shouldShow: !shouldShow)
        self.searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    @objc func handleShowSearchBar() {
        self.searchBar.becomeFirstResponder()
        self.search(shouldShow: true)
    }
    
    func reloadTable() {
        self.activityIndicator.stopAnimating()
        self.tableView.isHidden = !self.manager.containsReposItems()
        UIView.transition(with: self.tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)

    }
    
    func resetSearchData() {
        self.activityIndicator.stopAnimating()
        self.manager.restSearchData()
    }
    
    func updateTableList() {
        self.labelSearchListTitle.isHidden = self.manager.containsReposItems()
        if self.manager.searchRepository == nil && !self.manager.readServerMessage().isEmpty {
            self.showAlertMessage(titleStr: Strings.serverError, messageStr: self.manager.readServerMessage())
        }
        self.reloadTable()
    }
    
    func getSearchRepository(searchText: String) {
        self.activityIndicator.startAnimating()
        self.labelSearchListTitle.isHidden = true
        self.manager.findRepositoryList(ofString: searchText)
    }
    
    func getNextPageRepository() {
        self.manager.cancelAllOperation()
        self.activityIndicator.startAnimating()
        self.manager.findNextPageRepositoryList()
    }
}
