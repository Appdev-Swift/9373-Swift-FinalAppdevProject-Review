//
//  DataManager.swift
//  Project
//
//  Created by JvCervantes on 9/16/23.
//

import Foundation

// MARK: - Manager Class
class Manager {
    
    // MARK: Singleton Instance
    
    /// The shared instance of the Manager class.
    public static let share = Manager()
    
    // MARK: Properties
    
    /// A list of products managed by the Manager.
    var productsList = ProductList()
    
    // MARK: Private Initializer
    
    /// Private initializer to ensure the singleton pattern.
    private init() {}
    
}
