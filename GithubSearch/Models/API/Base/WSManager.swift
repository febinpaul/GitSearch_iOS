//
//  WSManager.swift
//  GithubSearch
//
//  Created by Febin on 27/08/21.
//

import Foundation
import Alamofire

class WSManager {
    
    func get(endPoint: String, params: [String: Any]? = [:], callback:  @escaping (WSNetworkResponse?, WSNetworkError?) ->()) {
        self.makeRequest(method: .get, endPoint: endPoint, params: params, encoding: URLEncoding.queryString,  callback: callback)
    }
    
    func post(endPoint: String, params: [String: Any]? = [:], callback:  @escaping (WSNetworkResponse?, WSNetworkError?) ->()) {
        self.makeRequest(method: .post, endPoint: endPoint, params: params, encoding: JSONEncoding.prettyPrinted, callback: callback)
    }
    
    func delete(endPoint: String, params: [String: Any]? = [:], callback:  @escaping (WSNetworkResponse?, WSNetworkError?) ->()) {
        self.makeRequest(method: .delete, endPoint: endPoint, params: params, encoding: JSONEncoding.prettyPrinted, callback: callback)
    }
    
    func makeRequest(method: HTTPMethod, endPoint: String, params: [String: Any]? = [:], encoding: ParameterEncoding, callback: @escaping (WSNetworkResponse?, WSNetworkError?) ->()) {
        AF.request(APIUrls.baseURL + endPoint, method: method, parameters: params, encoding:encoding, headers: nil).responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                callback(WSNetworkResponse(response: response), nil)
            case .failure(let error):
                callback(nil, WSNetworkError(error: error, code: response.response?.statusCode))
            }
        })
    }
}
