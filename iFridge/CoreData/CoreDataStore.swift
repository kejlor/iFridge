//
//  CoreDataStore.swift
//  iFridge
//
//  Created by Bartosz Wojtkowiak on 10/02/2022.
//

import Foundation
import CoreData

final class CoreDataStore {
    static let instante = CoreDataStore()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        let newProduct = Product(context: context)
        newProduct.name = "Cheese"
        newProduct.dateAdded = Date.now
        
        do {
            try context.save()
        } catch let error {
            print("Error saving core data. \(error.localizedDescription)")
        }
    }
}
