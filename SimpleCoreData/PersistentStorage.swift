//
//  PersistentStorage.swift
//  SimpleCoreData
//
//  Created by Muhammad Rehan on 9/5/22.
//

import Foundation
import CoreData

class PersistentStorage {
    
    private init() {}
    static let shared = PersistentStorage()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "SimpleCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    
    lazy var context  = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
