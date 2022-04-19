//
//  Sauce.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-18.
//

import Foundation

class Sauce: Codable {
    
    let name:String
    let price:Int
    
    init(name:String,price:Int){
        self.name = name
        self.price = price
    }
    
}
