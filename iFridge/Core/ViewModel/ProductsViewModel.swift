//
//  ProductsViewModel.swift
//  iFridge
//
//  Created by Bartosz Wojtkowiak on 10/02/2022.
//

import Foundation
import CoreData

final class ProductsViewModel: ObservableObject {
    let storage: CoreDataStore
    let viewContext: NSManagedObjectContext
    
    @Published var productName = ""
    @Published var dateAdded = Date()
    @Published var isAddingProduct = false
    @Published var newProductName = ""
    @Published var newProductDate = Date()
    
    init(storage: CoreDataStore) {
        self.storage = storage
        viewContext = storage.container.viewContext
        storage.fetchProducts()
    }
    
    func addProduct() {
        storage.addProduct(productName: newProductName, dateAdded: dateAdded)
        storage.saveData()
        storage.fetchProducts()
    }
}
