//
//  demo1.swift
//  Project
//
//  Created by slu ictr ilab 4 on 9/14/23.
//

import Foundation

public class User {
    var firstName: String
    var lastName: String
    var email: String
    var username: String
    var password: String
    var role: String
    var address: String
    var contactNumber: Int
    
    init(username: String, password: String, role: String) {
        self.username = username
        self.password = password
        self.role = role
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.address = ""
        self.contactNumber = 0
    }
}

public class UserInfo {
    var users: [User] = []
    
    /**
     Registers the user before login in
     */
    func register(username: String, password: String, role: String, firstName: String, lastName: String, address: String, contactNumber: String, email: String) {
     

    }
   
    /**
     Logins the user depends on their role
     */
    func login(username: String, password: String) -> User? {
       

    }
}
