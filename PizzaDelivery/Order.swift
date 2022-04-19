//
//  Order.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-18.
//

import Foundation

class Order: Codable {
    
    let orderId: String
    let orderAmount:Double
    let orderDate:Date
    var orderType:OrderType
    
    var orderItems:[FinalizedPizza] = []
    
    init(id:String,amount:Double,date:Date,type:OrderType) {
        self.orderId = id
        self.orderAmount = amount
        self.orderDate = date
        self.orderType = type
    }
    
    func addOrderItem(pizza:FinalizedPizza){
        orderItems.append(pizza)
    }
    
    func addAllOrderItems(items:[FinalizedPizza]){
        orderItems.append(contentsOf: items)
    }
}

enum OrderType:Codable{
    case LIVE,COMPLETED,CANCELLED
}
