//
//  CoreDataStack.swift
//  Event Manager
//
//  Created by Jonmichael Cheung on 2/17/22.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Event_Manager")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading persistent stores \(error)")
            }
        }
        return container
    }()
    
    
    static var context: NSManagedObjectContext { container.viewContext }
    
    static func saveContext() {
        if context.hasChanges {
            do{
                try context.save()
            }catch {
                NSLog("Error saving context \(error)")
            }
        }
    }
}

