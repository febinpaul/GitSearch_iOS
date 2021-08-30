//
//  SearchRepositoryProtocol.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

protocol SearchRepositoryProtocol {
    var totalCount: Int { get }
    var arrayItems: [ReposDetailDataProtocol] { get set }
}
