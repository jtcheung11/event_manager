//
//  EventController.swift
//  Event Manager
//
//  Created by Jonmichael Cheung on 2/17/22.
//

import Foundation
import CoreData

class EventController {
    
 static let shared = EventController()
    
    var events: [Event] {
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        return(try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    //CRUD
    
    //Create
    
    //WHERE DO I NEED TO USE THIS? 'EVENT'
    func createEvent (withTitle title: String, and fireDate: Date) {
       Event(title: title, fireDate: fireDate)
        saveToPersistentStore()
    }
    
    //UPdate
    func update(event: Event, newTitle: String, newFireDate: Date){
        event.title =  newTitle
        event.fireDate = newFireDate
        saveToPersistentStore()
    }
    
    //Toggle
    func toggleIsComplete(event: Event) {
        event.isComplete.toggle()
        saveToPersistentStore()
    }
    
    //Delete
    func delete(event: Event) {
        CoreDataStack.context.delete(event)
        saveToPersistentStore()
    }
    
    //Save
    func saveToPersistentStore() {
        do{
            try CoreDataStack.context.save()
        }catch {
            print("Warning: Error Saving!")
        }
    }
    
}// End of class
