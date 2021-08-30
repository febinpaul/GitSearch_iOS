//
//  CoreData.swift
//  GithubSearch
//
//  Created by Febin on 27/08/21.
//

import Foundation
import CoreData

class CoreData {

static let `default` = CoreData()

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "GithubSearch")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static var previewContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "GithubSearch")
      container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
      container.loadPersistentStores { _, error in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      }
      do {
        try container.viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
      return container
    }()
    
    private lazy var masterManagedObjectContext: NSManagedObjectContext = {
        let context = self.persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        return context
    }()
    
    lazy var mainManagedObjectContext: MainManagedObjectContext = {
        let context = MainManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = self.masterManagedObjectContext
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        return context
    }()
}
