//
//  iFridgeApp.swift
//  iFridge
//
//  Created by Bartosz Wojtkowiak on 10/02/2022.
//

import SwiftUI

@main
struct iFridgeApp: App {
    let coreDataStore = CoreDataStore()
    
    var body: some Scene {
        WindowGroup {
            ProductsView(storage: coreDataStore)
        }
    }
}
