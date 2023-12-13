//
//  Cart.swift
//  Project
//
//  Created by Eurecho Aque on 9/16/23.
//

import Foundation

/// Represents an item in the shopping cart, consisting of a product and its quantity.
struct CartItems {
    let product: Product
    var quantity: Int
}

/// Manages the shopping cart, allowing users to add items, calculate total cost, and process payments.
public class Cart {
    
    /// An array to store the items in the shopping cart.
    var items: [CartItems] = []
    
    /// Adds a specified quantity of a product to the shopping cart.
    ///
    /// - Parameters:
    ///   - product: The product to be added to the cart.
    ///   - quantity: The quantity of the product to be added.
    func addItem(product: Product, quantity: Int) {
        // Check if the product is already in the cart
        if let index = items.firstIndex(where: { $0.product.name == product.name }) {
            items[index].quantity += quantity
        } else {
            // If not, add a new CartItems entry to the cart
            items.append(CartItems(product: product, quantity: quantity))
        }
    }
    
    /// Calculates and returns the total cost of all items in the shopping cart.
    ///
    /// - Returns: The total cost of items in the cart.
    func totalCost() -> Double {
        let total = items.reduce(0.0) { $0 + ($1.product.price * Double($1.quantity))}
        return total
    }

    /// Processes the payment for the items in the shopping cart.
    ///
    /// - Parameter paymentAmount: The amount provided by the user for payment.
    /// - Returns: A boolean indicating whether the payment was successful.
    func processPayment(paymentAmount: Double) -> Bool {
        var status: Bool = false
        
        print("\n*************** Mode of Payment ***************\n")
        print("1. Pay via Cash(COD)")
        print("2. Pay via Gcash")
        print("\nEnter your mode of payment: ")
        
        // Read the user's payment choice
        let choice = readLine() ?? ""
        let paymentChoice = Int(choice)
        
        if paymentChoice == 1 {
            // Payment via Cash
            print("====Items====")
            for index in 0..<items.count {
                let item = items[index]
                print("\(index + 1). \(item.product.name) - \(item.quantity) - Php\(item.product.price)")
            }
            
            print("Total Cost: \(totalCost())")
            print("Enter amount: ")
            let amount = Double(readLine() ?? "")
            let totalCost = totalCost()
            let change = amount! - totalCost
            
            print("Press Enter to Continue...")
            _ = readLine()
            print("Change: \(change)")
            
        } else if paymentChoice == 2 {
            // Payment via Gcash
            print("===== Items =====")
            for index in 0..<items.count {
                let item = items[index]
                print("\(index + 1). \(item.product.name) - \(item.quantity) - Php\(item.product.price)")
            }
            
            print("Total Cost: \(totalCost())")
            print("Enter GCASH number: ")
            let gcashNumber = Int(readLine() ?? "")
            
            // Generate a random GCASH PIN
            let pinNumOne = String(Int.random(in: 0...9))
            let pinNumTwo = String(Int.random(in: 0...9))
            let pinNumThree = String(Int.random(in: 0...9))
            let pinNumFour = String(Int.random(in: 0...9))
            let generatedPin = pinNumOne + pinNumTwo + pinNumThree + pinNumFour
            
            print("Generated Pin: \(generatedPin)")
            
            print("Enter GCASH PIN: ")
            let gcashPinNum = readLine() ?? ""
            
            // Check if the entered PIN matches the generated PIN
            if gcashPinNum == generatedPin {
                let amount: Double = 10000
                let totalCost = totalCost()
                let change = amount - totalCost
                
                print("Press Enter to Continue...")
                _ = readLine()
                print("Change: \(change)")
                status = true
            } else {
                print("Invalid PIN number")
            }
            
        } else {
            print("Invalid input! Please choose 1 or 2 only")
        }
        
        return status
    }

    /// Completes the checkout process, processing payment and confirming the order.
    func checkout() {
        let totalCost = totalCost()
        print("Total cost: $\(totalCost)")
        
        // Process payment and display the result
        let paymentSuccessful = processPayment(paymentAmount: totalCost)
        
        if paymentSuccessful {
            print("Payment successful. Your order is confirmed.")
        } else {
            print("Payment failed. Please try again.")
        }
    }
}
