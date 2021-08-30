//
//  WSNetworkError.swift
//  GithubSearch
//
//  Created by Febin on 27/08/21.
//

import Foundation
import Alamofire

class WSNetworkError {
    
    var code: Int = 0
    var message: String = "An unknown error occured"
    
    init(error: Any, code: Int? = nil) {
        if let err = error as? AFError {
            self.message = err.localizedDescription
            self.code = code ?? 0
        }
    }
}
