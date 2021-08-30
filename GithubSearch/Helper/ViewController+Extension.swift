//
//  ViewController+Extension.swift
//  GithubSearch
//
//  Created by Febin Paul on 29/08/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertMessage(titleStr:String, messageStr:String) {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
