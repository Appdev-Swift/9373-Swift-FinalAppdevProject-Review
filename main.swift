//
//  main.swift
//  Project
//
//  Created by slu ictr ilab 4 on 9/14/23.
//

import Foundation

let userInfo = UserInfo()
let consumerProfile = ConsumerProfile()
let farmerProfile = FarmerProfile()

mainMenu()

/**
 Displays the main menu choices
 */
func mainMenu() {
    while true {
        print("\n=============== WELCOME TO ONLINE MARKET ===============")
        print("1. Register")
        print("2. Login")
        print("3. Quit\n")
        print("Enter choice: ", terminator: "")
            
        if let choice = readLine(), let intChoice = Int(choice) {
            switch intChoice {
            case 1:
                print("\nEnter your firstName: ")
                let firstName = readLine() ?? ""
                print("Enter your lastName: ")
                let lastName = readLine() ?? ""
                print("\nEnter your username: ")
                let username = readLine() ?? ""
                print("Enter your password: ")
                let password = readLine() ?? ""
                print ("Enter your Phone Number: ")
                let address = readLine() ?? ""
                // Example usage:
                let contactNumber = getValidContactNumber()
                print("You entered a valid contact number: \(contactNumber)")
                print("\nEmail:")
                let email = readLine() ?? ""
                var role: String = ""
                while true  {
                    print("Register as a buyer or seller? : ")
                    let ans = readLine()?.lowercased() ?? ""
                    if ans == "buyer" || ans == "seller" {
                        role = ans
                        break
                    } else {
                        print("\nInvalid role. Please enter 'buyer' or 'seller' only.\n")
                    }
                }
                
                userInfo.register(username: username, password: password, role: role, firstName:
                 firstName, lastName: lastName, address: address, contactNumber: contactNumber, email: email)
                print("\nRegistration Successful!")
            case 2:
                print("\nEnter your username: ")
                let username = readLine() ?? ""
                print("Enter your password: ")
                let password = readLine() ?? ""

                if let user = userInfo.login(username: username, password: password) {
                    print("\nLogin Successful!")
                    
                    if user.role == "buyer" {
                        consumerProfile.buyerMenu()
                    } else if user.role == "seller" {
                        farmerProfile.sellerMenu()
                    }
                } else {
                    print("\nInvalid username or password.\n")
                }
            case 3:
                print("\nThank you for shopping!\n")
                exit(0)
            default:
                print("\nInvalid choice. Please enter 1-3 only.\n")
            }
        }
     
        func isContactNumberValid(_ contactNumber: String) -> Bool {
            // Define your criteria for a valid contact number
            let digitSet = CharacterSet.decimalDigits
            let nonDigitSet = digitSet.inverted
            
            // Check if the contact number contains only digits and has a specific length requirement
            let cleanedContactNumber = contactNumber.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
            
            if cleanedContactNumber.count == 11, cleanedContactNumber.rangeOfCharacter(from: nonDigitSet) == nil {
                return true
            } else {
                return false
            }
        }

        func getValidContactNumber() -> String {
            var userInput: String
            
            repeat {
                print("Please enter a valid 11-digit contact number: (Do not include 0 or +63)")
                if let input = readLine() {
                    userInput = input
                } else {
                    userInput = ""
                }
            } while !isContactNumberValid(userInput)
            
            return userInput
        }
    }
}
