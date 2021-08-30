//
//  Constant.swift
//  GithubSearch
//
//  Created by Febin Paul on 27/08/21.
//

import Foundation

struct Strings {
    static let githubSearch = "Github Search"
    static let empty = ""
    static let unknownError = "Unknown Error"
    static let pageCount = 10
    static let searchTextTitle = "Empty Search List"
    static let serverError = "Server Error"
}

struct Entity {
    static let gitRepositoryMarked = "GitRepositoryMarked"
}

struct APIUrls {
    static let baseURL = "https://api.github.com"
}

struct APIEndpoint {
    static let searchRepos = "/search/repositories"
}

struct DateFormatters {
    static let yyyySMMSddTHHCmmCssZ = "yyyy-MM-dd'T'HH:mm:ssZ" // 2016-09-22T10:42:55Z
    static let ddHMMHyyy = "dd/MM/yyy" // 2016-09-22T10:42:55Z
}
