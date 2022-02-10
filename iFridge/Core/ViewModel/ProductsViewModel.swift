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
    
    @Published var products = [Product]()
    @Published var productName = ""
    @Published var dateAdded = Date()
    
    init(storage: CoreDataStore) {
        self.storage = storage
        viewContext = storage.container.viewContext
        fetchProducts()
    }
    
    func saveData() {
        do {
            try viewContext.save()
            fetchProducts()
            print("✅ Saved data")
        } catch {
            print("❌ Error while saving: \(error.localizedDescription)")
        }
    }
    
    func fetchProducts() {
        let request = NSFetchRequest<Product>(entityName: "Product")
        do {
            products = try viewContext.fetch(request)
            print("✅ Fetched data")
        } catch  {
            print("❌ Error fetching data: \(error.localizedDescription)")
        }
    }
    
    func addProduct(productName: String, dateAdded: Date) {
        let newProduct = Product(context: viewContext)
        newProduct.name = productName
        newProduct.dateAdded = dateAdded
        saveData()
    }
}
