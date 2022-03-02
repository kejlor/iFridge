//
//  PreviewProvider+Ext.swift
//  iFridge
//
//  Created by Bartosz Wojtkowiak on 10/02/2022.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

final class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let storage = CoreDataStore()
    
    func mockProduct() -> Product {
        let product = Product(context: storage.container.viewContext)
        product.name = "Salad"
        product.dateAdded = Date()
        
        return product
    }
}
