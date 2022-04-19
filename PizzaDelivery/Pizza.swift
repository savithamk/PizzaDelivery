//
//  Pizza.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-18.
//

import Foundation
class Pizza: Codable{
    
    let Id:Int
    let name:String
    let fullDescription: String
    let imageRefName: String
    
    init(Id:Int,name:String,fullDescription:String,imageRefName:String){
        self.Id = Id
        self.name = name
        self.fullDescription = fullDescription
        self.imageRefName = imageRefName
    }
    
}

class FinalizedPizza: Pizza{
    
    var size:Size?
    var crust:Crust?
    var sauce:Sauce?
    
    var toppings:[Topping] = []
    
    func addTopping(topping:Topping){
        toppings.append(topping)
    }
    
    func pizzaCost() -> Double{
        var total:Int = 0
        //Adding cost of size
        total += size?.price ?? 0
        //Adding cost of crust
        total += crust?.price ?? 0
        //Adding cost of sauce
        total += sauce?.price ?? 0
        //Adding cost of toppings
        for t in toppings {
            total += t.price
        }
        return Double(total)/Double(100)
    }
    
}
