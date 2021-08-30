//
//  Date+Extension.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation

extension Date {
    
    func convertStringToFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = NSTimeZone.local
        return formatter.string(from: self)
    }
}
