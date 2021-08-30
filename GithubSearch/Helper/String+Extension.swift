//
//  String+Extension.swift
//  GithubSearch
//
//  Created by Febin Paul on 28/08/21.
//

import Foundation


extension String {
    
    func stringTodate(in format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
