//
//  DataManager.swift
//  Project
//
//  Created by JvCervantes on 9/16/23.
//

import Foundation
class Manager{
    public static let share = Manager()
    var productsList = ProductList()
    private init(){
    }
}
