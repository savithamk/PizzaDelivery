//
//  DataService.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-18.
//

import Foundation

class DataService{
    
    static let dataManager = DataService()
    
    private var sizes:[Int:Size] = [:]
    private var crusts:[Int:Crust] = [:]
    private var sauces:[Int:Sauce] = [:]
    private var toppings:[Int:Topping] = [:]
    
    private var offerings:[Pizza] = []
    
    private var cart:[FinalizedPizza]! = []
    
    private var orders:[Order]=[]
    
    private let orderSections:[String] = ["In Progress","Completed","Cancelled"]
    
    private var userDefaults = UserDefaults()
    
    private init(){
        loadDefaults()
        
        do{
            let data = userDefaults.object(forKey: "orderhistory")
            if(nil != data){
                //data = data as! Data
                orders = try JSONDecoder().decode([Order].self, from: data as! Data)
            }
        }catch{}
        
    }
    
    
    func availableSizes() -> [Int:Size]  {
        sizes
    }
    
    func availableCrusts() -> [Int:Crust] {
        crusts
    }
    
    func availableSauces() -> [Int:Sauce] {
        sauces
    }
    
    func availableToppings() -> [Int:Topping]  {
        toppings
    }
    
    func availableOfferings() -> [Pizza] {
        offerings
    }
    
    func addToCart(pizza: FinalizedPizza) {
        cart.append(pizza)
    }
    
    func fetchCart() -> [FinalizedPizza]{
        cart
    }
    
    func clearCart(){
        cart.removeAll()
    }
    
    func addOrder(order:Order){
        orders.append(order)
    }
    
    func fetchOrders() -> [String:[Order]]{
        var mappedOrders:[String:[Order]] = [:]
        var live: [Order] = []
        var completed: [Order] = []
        var cancelled: [Order] = []
        for o in orders {
            if o.orderType == .LIVE {
                live.append(o)
            } else if o.orderType == .COMPLETED {
                completed.append(o)
            } else if o.orderType == .CANCELLED {
                cancelled.append(o)
            }
        }
        live.sort(by: {$0.orderDate < $1.orderDate})
        completed.sort(by: {$0.orderDate < $1.orderDate})
        cancelled.sort(by: {$0.orderDate < $1.orderDate})
        mappedOrders.updateValue(live, forKey: orderSections[0])
        mappedOrders.updateValue(completed, forKey: orderSections[1])
        mappedOrders.updateValue(cancelled, forKey: orderSections[2])
        return mappedOrders
    }
    
    func cancelOrder(uuid: String){
        orders.filter({$0.orderId == uuid}).forEach({
            order in
            order.orderType = .CANCELLED
        })
    }
    
    func deleteOrder(uuid: String){
        orders.removeAll(where: {$0.orderId == uuid})
    }
    
    func updateOrders(){
        orders.filter({$0.orderType == .LIVE}).forEach({
            order in
            order.orderType = .COMPLETED
        })
        updateUserDefaultsData()
    }
    
    private func updateUserDefaultsData(){
        try? userDefaults.set(JSONEncoder().encode(orders), forKey: "orderhistory")
    }
    
    /*let pizzaImages:[String] = ["cheesy-chicken","garden-veggie","meat-supreme","mushroom","pepperoni","tangy-tomato"]
    let pizzaNames:[String] = ["Cheesy Chicken","Garden Veggie","Meat supreme","Mushroom","Pepperoni","Tangy Tomato"]
    
    let pizzaDesc:[String] = ["Cheese, Seasoned Grilled Chicken Breast, Green Peppers, Pizza Mozzarella","Sliced Mushrooms, Green Pepper, Red Onion, Tomato and Pizza Mozzarella","Pepperoni, Green Pepper, Sliced Mushrooms, Red Onion and Pizza Mozzarella","Loaded with Mozzarella, Roasted Red Peppers, Green Peppers and Extra Cheese","Double Pepperoni and Extra Pizza Mozzarella, Green Pepper, Sliced Mushrooms, Red Onion","Loaded with Mozzarella, Diced Tomato,Red Onion, Sliced Mushroom and Green Pepper"]
    */
    
    private func loadDefaults(){
        //Loading Sizes
        sizes[0] = (Size(name:"S", price: 599))
        sizes[1] = (Size(name:"M", price: 1199))
        sizes[2] = (Size(name:"L", price: 1399))
        sizes[3] = (Size(name:"XL", price: 1599))
        
        //Loading crusts
        crusts[4] = (Crust(name: "Classic", price: 0))
        crusts[5] = (Crust(name: "Thin", price: 99))
        
        //Loading sauces
        sauces[6] = (Sauce(name: "BBQ", price: 199))
        sauces[7] = (Sauce(name: "Tomato", price: 0))
        sauces[8] = (Sauce(name: "Creamy Garlic", price: 99))
        
        //Loading toppings
        toppings[9] = (Topping(name: "Pineapple", price: 50))
        toppings[10] = (Topping(name: "Jalapenos", price: 50))
        toppings[11] = (Topping(name: "Spinach", price: 50))
        toppings[12] = (Topping(name: "Green Peppers", price: 50))
        toppings[13] = (Topping(name: "Panneer", price: 99))
        toppings[14] = (Topping(name: "Red Onions", price: 50))
        toppings[15] = (Topping(name: "Mushroom", price: 99))
        toppings[16] = (Topping(name: "Ground Beef", price: 120))
        toppings[17] = (Topping(name: "Chicken", price: 99))
        toppings[18] = (Topping(name: "Tuna", price: 250))
        toppings[19] = (Topping(name: "Shrimp", price: 175))
        toppings[20] = (Topping(name: "Pepperoni", price: 175))
        
        offerings.append(Pizza(Id: 1, name: "Garden Veggie", fullDescription: "Garden Veggie,Garden Veggie,Garden Veggie,Garden Veggie", imageRefName: "garden-veggie"))
        offerings.append(Pizza(Id: 2, name: "Veggie Delight", fullDescription: "Veggie Delight,Veggie Delight,Veggie Delight", imageRefName: "veggie-delight"))
        offerings.append(Pizza(Id: 3, name: "Mushroom", fullDescription: "Mushroom,Mushroom,Mushroom,Mushroom,Mushroom,Mushroom", imageRefName: "mushroom"))
        offerings.append(Pizza(Id: 4, name: "Cheesy Chicken", fullDescription: "Cheesy Chicken,Cheesy Chicken,Cheesy Chicken", imageRefName: "cheesy-chicken"))
        offerings.append(Pizza(Id: 5, name: "Meat Supreme", fullDescription: "Meat supreme,Meat supreme,Meat supreme,Meat supreme", imageRefName: "meat-supreme"))
        offerings.append(Pizza(Id: 6, name: "Pepperoni", fullDescription: "Pepperoni,Pepperoni,Pepperoni,Pepperoni,Pepperoni", imageRefName: "pepperoni"))
        
    }
    
    
}
