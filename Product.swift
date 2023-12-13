//
//  Product.swift
//  Project
//
//  Created by Eurecho Aque on 9/16/23.
//

import Foundation

public class Product {
    var name: String
    var price: Double
    var harvestTime: String
    
    init(name: String, price: Double, harvestTime: String) {
        self.name = name
        self.price = price
        self.harvestTime = harvestTime
    }
    static func getProducts() -> [Product] {
        return Manager.share.productsList.products
    }
    
}
public class ProductList{
    var products: [Product] = [
        Product(name: "BrownRice", price: 80.0, harvestTime: "2023-04-12"),
        Product(name: "Strawberry", price: 150.0, harvestTime: "2023-02-10"),
        Product(name: "Carrot", price: 90.0, harvestTime: "2023-11-20"),
        Product(name: "WhiteOnion", price: 165.0, harvestTime: "2023-02-23"),
        Product(name: "Avocado", price: 250.0, harvestTime: "2023-10-28"),
        Product(name: "Durian", price: 185.0, harvestTime: "2023-09-14"),
        Product(name: "Beans", price: 215.0, harvestTime: "2023-12-13"),
        Product(name: "Sweet Potato", price: 110.0, harvestTime: "2023-12-25"),
        Product(name: "Chayote", price: 110.0, harvestTime: "2023-12-18"),
        Product(name: "Broccoli", price: 200.0, harvestTime: "2023-11-25")
    ]
    
    func addElement(name: String, price: Double, harvestTime: String) {
        let newProduct = Product(name: name, price: price, harvestTime: harvestTime)
        Manager.share.productsList.products.append(newProduct)
    }
    
    func removeElement() {
        Manager.share.productsList.updated()
        print("Enter number of product: ", terminator: "")
        let index = Int(readLine() ?? " ")
        Manager.share.productsList.products.remove(at: index!-1)
        print("Product succesfully removed!")
    }
    
    func updated(){
        for index in 0..<products.count {
            let product = products[index]
            print("\(index + 1). \(product.name) - Php\(product.price)/kg -\(product.harvestTime)")
        }
    }
}
