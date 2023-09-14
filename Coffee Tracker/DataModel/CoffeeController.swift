//
//  DataController.swift
//  Coffee Tracker
//
//  Created by Clem OJ on 14/09/2023.
//

import Foundation
import CoreData

class CoffeeController:ObservableObject {
    let container = NSPersistentContainer(name: "Coffee Tracker")
    
    init(){
        container.loadPersistentStores { description , error in
            if let error = error {
                print("Failed to load data in coffee controller \(error.localizedDescription)")
            }
        }
    }
}

