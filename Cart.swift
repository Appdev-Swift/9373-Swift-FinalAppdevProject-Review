//
//  Cart.swift
//  Project
//
//  Created by Eurecho Aque on 9/16/23.
//

import Foundation

struct CartItems {
    let product: Product
    var quantity: Int
}

public class Cart {
    var items: [CartItems] = []
    
    func addItem(product: Product, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.name == product.name }) {
            items[index].quantity += quantity
        } else {
            items.append(CartItems(product: product, quantity: quantity))
        }
    }
    
    func totalCost() -> Double {
        let total = items.reduce(0.0) { $0 + ($1.product.price * Double($1.quantity))}
        return total
    }

    
    func processPayment(paymentAmount: Double) -> Bool {
        var status: Bool = false
        print("\n*************** Mode of Payment ***************\n")
        print("1. Pay via Cash(COD)")
        print("2. Pay via Gcash")
        print("\nEnter your mode of payment: ")
        let choice = readLine() ?? ""
        let paymentChoice = Int(choice)
        if paymentChoice == 1 {
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
        } else if paymentChoice == 2{
            print("===== Items =====")
            for index in 0..<items.count {
                let item = items[index]
                print("\(index + 1). \(item.product.name) - \(item.quantity) - Php\(item.product.price)")
            }
            print("Total Cost: \(totalCost())")
            print("Enter GCASH number: ")
            let gcashNumber = Int(readLine() ?? "")
            let pinNumOne = String(Int.random(in: 0...9))
            let pinNumTwo = String(Int.random(in: 0...9))
            let pinNumThree = String(Int.random(in: 0...9))
            let pinNumFour = String(Int.random(in: 0...9))
            let generatedPin = pinNumOne + pinNumTwo + pinNumThree + pinNumFour
            print("Generated Pin: \(generatedPin)")    
            print("Enter GCASH PIN: ")
            let gcashPinNum = readLine() ?? ""
            if gcashPinNum == generatedPin {
                let amount: Double =  10000
                let totalCost = totalCost()
                let change = amount - totalCost
                print("Press Enter to Continue...")
                _ = readLine()
                print("Change: \(change)")
                status = true
            } else {
                print("invalid pin number")
            }
            }else {
                print("Invalid input! Please choose 1 or 2 only")
                }
                return status
        }

           
        
   

    func checkout() {
        let totalCost = totalCost()
  //    print("Total cost: $\(totalCost)")
        let paymentSuccessful = processPayment(paymentAmount: totalCost)
        if paymentSuccessful {
            print("Payment successful. Your order is confirmed.")
        } else {
            print("Payment failed. Please try again.")
        }
    }
}
