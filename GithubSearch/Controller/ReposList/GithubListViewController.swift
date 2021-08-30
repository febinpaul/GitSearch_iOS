//
//  GithubListViewController.swift
//  GithubSearch
//
//  Created by Febin Paul on 27/08/21.
//

import UIKit

class GithubListViewController: UIViewController {
    
    var timer: Timer?
    let searchBar = UISearchBar()
    var manager: ReposListDataProtocol!
    
    var tableView: UITableView = {
        let myTableView = UITableView()
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 300
        myTableView.register(GithubListCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.isHidden = true
        return myTableView
    }()
    
    var labelSearchListTitle: UILabel = {
        let label = UILabel()
        label.text = Strings.searchTextTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    init(managerProtocol: ReposListDataProtocol) {
        self.manager = managerProtocol
        super.init(nibName: nil, bundle: nil)
        self.manager.delegate = self
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialAction()
    }
}




