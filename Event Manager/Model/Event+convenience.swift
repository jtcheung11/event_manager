//
//  Event+convenience.swift
//  Event Manager
//
//  Created by Jonmichael Cheung on 2/17/22.
//

import Foundation
import CoreData

extension Event {
    
    convenience init(title: String, isComplete: Bool = false, fireDate: Date, uuidString: String = UUID().uuidString, context:NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.isComplete = isComplete
        self.fireDate = fireDate
        self.uuidString = uuidString
        
    }
}
