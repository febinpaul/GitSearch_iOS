//
//  AppDelegate.swift
//  GithubSearch
//
//  Created by Febin Paul on 27/08/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow()
        window?.makeKeyAndVisible()
        
        let navController = UINavigationController(rootViewController: GithubListViewController(managerProtocol: ReposListDataSource()))
        window?.rootViewController = navController
        
        return true
    }
}

