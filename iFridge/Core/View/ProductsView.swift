//
//  ProductsView.swift
//  iFridge
//
//  Created by Bartosz Wojtkowiak on 10/02/2022.
//

import SwiftUI

struct ProductsView: View {
    @StateObject private var vm: ProductsViewModel
    @State private var isAddingProduct = false
    @State private var newProductName = ""
    @State private var newProductDate = Date()
    
    init(storage: CoreDataStore) {
        _vm = StateObject(wrappedValue: ProductsViewModel(storage: storage))
    }
    
    var body: some View {
        VStack {
            addNewProduct
            if vm.products.isEmpty {
                emptyContent
            } else {
                productsList
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(storage: dev.storage)
    }
}

extension ProductsView {
    private var addNewProduct: some View {
        VStack {
            Spacer()
            TextField("New product name", text: $newProductName)
                .multilineTextAlignment(TextAlignment.center)
            DatePicker(selection: $newProductDate, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
            }
            Button {
                vm.addProduct(productName: newProductName, dateAdded: newProductDate)
                vm.saveData()
                vm.fetchProducts()
                newProductName = ""
                newProductDate = Date()
            } label: {
                Text("Add product")
                    .foregroundColor(Color.primary)
                    .font(.body)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(40)
            }
            .disabled(newProductName.isEmpty)
        }
        .padding(.vertical, 40)
    }
    
    private var emptyContent: some View {
        VStack {
            Image(systemName: "nosign")
            Text("No entries in list")
        }
    }
    
    private var productsList: some View {
        List {
            ForEach(vm.products, id: \.self) { product in
                Text(product.name ?? "no name")
            }
        }
    }
}
