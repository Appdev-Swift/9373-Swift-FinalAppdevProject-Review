//
//  UserPage.swift
//  Project
//
//  Created by slu ictr ilab 4 on 9/14/23.
//
import Foundation

public class ConsumerProfile {
    let cart = Cart()
    let user = UserInfo()
    /**
     Displays the main menu choices
     */
    func buyerMenu() {
        while true {
            print("\n--------------- Welcome Buyer ---------------")
            print("1. Browse Products")
            print("2. Search for Product")
            print("3. Cart")
            print("4. Logout\n")
            print("Enter choice: ", terminator: "")
            
            if let choice = readLine(), let intChoice = Int(choice) {
                switch intChoice {
                case 1:
                    browseProducts()
                case 2:
                    searchProducts()
                case 3:
                    displayCart()
                case 4:
                    mainMenu()
                default:
                    print("\nInvalid choice. Please choose 1 - 4 only.\n")
                }
            } else {
                print("\nInvalid input. Please enter an integer.\n")
            }
        }
    }
    
     /**
     allows user to checkout
     */
    func displayCart() {
        print("\n*************** Cart ***************\n")
        for index in 0..<cart.items.count {
            let item = cart.items[index]
            print("\(index + 1). \(item.product.name) - \(item.quantity) - Php\(item.product.price * Double(item.quantity))")
        }
        print("\nTotal Cost: $\(cart.totalCost())")
        print("************* Checkout *************")
        print("1. Proceed to checkout \n2. Go back to Main Menu")

        print("\nEnter choice): ", terminator: "")
         if let choice = readLine(), let productNumber = Int(choice) {
            if productNumber == 2 {
                return
            } else if productNumber == 1 {
                cart.checkout()
            } else {
                print("Invalid Input!")
            }
        } else {
            print("\nInvalid Input. Please try again\n")
        }
    }  

    /**
     Displays all the list of products
     */
    func browseProducts() {
        let products = Product.getProducts()
        print("\n*************** Products ***************\n")
        print("No.\t\tProductName\tPrice\tHarvested Date")
        
        Manager.share.productsList.updated()
        
        print("\nEnter the product number to add to cart (or '0' to return back to menu): ")
        if let choice = readLine(), let productNumber = Int(choice) {
            if productNumber == 0 {
                return
            } else if productNumber >= 1 && productNumber <= products.count {
                let productNumber = products[productNumber - 1]
                
                print("Enter quantity: ", terminator: "")
                if let number = readLine(), let quantity = Int(number), quantity > 0 {
                    cart.addItem(product: productNumber, quantity: quantity)
                    print("\n\(quantity) \(productNumber.name) successfully added to cart.")
                } else {
                    print("\nInvalid quantity. Product failed to add to cart.\n")
                }
            } else {
                print("\nInvalid product number.\n")
            }
        } else {
            print("\nInvalid input. Please enter an integer.\n")
        }
    }
    
    /**
     allows user to search the product
     */
    func searchProducts() {
        print("\nEnter product name: ", terminator: "")
        if let productName = readLine() {
            let product = Product.getProducts()
            var productSearched: Product? = nil
            
            for products in product {
                if products.name.lowercased() == productName.lowercased() {
                    productSearched = products
                    break
                }
            }
            
            if let productName = productSearched {
                print("\nProduct found: \(productName.name) - Php\(productName.price)")
                print("\nDo you want to add '\(productName.name)' to cart? (yes/no): ")
                
                if let ans = readLine()?.lowercased() {
                    if ans == "yes" {
                        print("Enter quantity: ", terminator: "")
                        if let number = readLine(), let quantity = Int(number), quantity > 0 {
                            cart.addItem(product: productName, quantity: quantity)
                            print("\n\(quantity) \(productName.name) successfully added to cart.")
                        } else {
                            print("\nInvalid quantity. '\(productName.name)' failed to add to cart.\n")
                        }
                    } else if ans == "no" {
                        return
                    } else {
                        print("\nInvalid input. Please enter 'yes' or 'no' only.\n")
                    }
                }
            } else {
                print("\nProduct not found.\n")
            }
        }
    }
}
