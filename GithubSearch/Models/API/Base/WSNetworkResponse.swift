//
//  WSNetworkResponse.swift
//  GithubSearch
//
//  Created by Febin on 27/08/21.
//

import Foundation
import Alamofire

class WSNetworkResponse {
    
    var rawResponse: AFDataResponse<Any>?
    var rawData: Any?
    var error: String?
    var statusCode: String?
    var success: Bool = false
    var dataBytes: Data?
    
    var data: Any? {
        get {
            return self.rawData
        }
    }
    
    init(response: AFDataResponse<Any>) {
        self.rawResponse = response
        switch response.result {
        case .success(let value):
            self.success = true
            self.rawData = value
        case .failure(let error):
            self.success = false
            self.error = error.errorDescription
        }
    }
    
    func isSuccessful()->Bool {
        return self.success
    }
}
