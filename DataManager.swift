//
//  DataManager.swift
//  Project
//
//  Created by JvCervantes on 9/16/23.
//

import Foundation

/// `Manager` class is responsible for managing and sharing data across the application.
class Manager {
    
    /// Shared instance of the `Manager` class, following the singleton pattern.
    public static let share = Manager()
    
    /// An instance of the `ProductList` class, managing the list of products in the application.
    var productsList = ProductList()
    
    /// Private initializer to enforce the singleton pattern and prevent external instantiation.
    private init() {}
}
