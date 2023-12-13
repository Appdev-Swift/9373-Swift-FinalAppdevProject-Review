//
//  SellerPage.swift
//  Project
//
//  Created by slu ictr ilab 4 on 9/14/23.
//

import Foundation

public class FarmerProfile {
    
    /**
     Displays the main menu choices
     */
    func sellerMenu() {
        while true{
            print("\n--------------- Welcome Seller ---------------")
            print("1. Add Products") //Equivalent to sell products
            print("2. Remove Products")
            print("3. Learning Materials for Farming")
            print("4. Logout\n")
            print("Enter choice: ", terminator: "")
            if let choice = readLine(), let intChoice = Int(choice) {
                switch intChoice {
                case 1:
                    AddProduct()
                case 2:
                    Manager.share.productsList.removeElement()
                case 3:
                    displayMaterials()
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
     allows seller to add products
     */
    func AddProduct(){
        print("Enter product name: ", terminator: "")
        let productName = readLine() ?? ""
        print("Enter your price: ", terminator: "")
        let productPrice = Double(readLine() ?? "")
        print("Enter harvest time : ", terminator: "")
        let timeHarvest = readLine() ?? ""
        print("\(productName) was successfully added!")
        Manager.share.productsList.addElement(name: productName, price: productPrice!, harvestTime: timeHarvest)
        print("Updated")
        Manager.share.productsList.updated()
    }
    
    /**
     Displays learning materials for seller
     */
    func displayMaterials(){
        print("""
"1. Revolutionizing Agriculture: Modern Farming Practices in the Philippines - Agustin, Aljay"
"2. Sustainable Farming Solutions for Filipino Farmers - Aque, Eury"
"3. The Rice Bowl of Asia: Farming Success in the Philippines - Avillanoza, Flare"
"4. Agricultural Innovations: Driving Growth in the Philippine Farming Sector - Sollorin, John Michae"
"5. From Field to Table: The Story of Farming in the Philippines - Roque, Genrev"
"6. Empowering Farmers: Technology's Role in Philippine Agriculture - Natividad, Rhyen"
"7. Challenges and Triumphs: The Filipino Farmer's Journey - Diola, Mckenzie"
"8. Philippine Agriculture: Adapting to Climate Change for a Greener Future - Roque, Genrev & Natividad, Rhyen"
"9. Organic Farming in the Philippines: Nurturing Healthier Harvests - Diola, Mckenzie & Avillanoza, Flare"
"10. Rural Prosperity: The Heartbeat of Farming in the Philippines - Sollorin, John Michael & Agustin, Aljay"
""")
    } 
}
