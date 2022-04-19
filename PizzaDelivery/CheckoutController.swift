//
//  CheckoutController.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-12.
//

import UIKit

class CheckoutController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    let cartItemCellIdentifier = "cartItemCell"
    
    var cart:[FinalizedPizza]! = []
    
    let dataService:DataService = DataService.dataManager

    @IBOutlet weak var cartTable: UITableView!
    
    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var deliveryFee: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = ""
        cart = dataService.fetchCart()
        loadTotals()
        cartTable.register(UINib(nibName: "CartTableCell", bundle: nil), forCellReuseIdentifier: cartItemCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTable.dequeueReusableCell(withIdentifier: cartItemCellIdentifier, for: indexPath) as! CartTableCell
        
        cell.itemImage.image = UIImage(named: cart[indexPath.row].imageRefName)
        cell.itemName.text = cart[indexPath.row].name
        
        cell.itemCost.text = String(cart[indexPath.row].pizzaCost())
        
        return cell
    }
    
    func loadTotals(){
        var cartTotal:Double = 0
        
        for pizza in cart {
            cartTotal += pizza.pizzaCost()
        }
        
        let deliveryCharges:Double = 0.01 * cartTotal
        let taxAmount:Double = 0.08 * (cartTotal+deliveryCharges)
        
        
        subTotal.text = String(format:"%.2f",cartTotal)
        deliveryFee.text = String(format:"%.2f",deliveryCharges)
        tax.text = String(format:"%.2f",taxAmount)
        total.text = String(format:"%.2f",cartTotal + deliveryCharges + taxAmount)
    }
    
    func cartTotal()-> Double{
        var cartTotal:Double = 0
        
        for pizza in cart {
            cartTotal += pizza.pizzaCost()
        }
        
        let deliveryCharges:Double = 0.01 * cartTotal
        let taxAmount:Double = 0.08 * (cartTotal+deliveryCharges)
        
        return cartTotal + deliveryCharges + taxAmount
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newOrder = Order(id: UUID().uuidString,amount: cartTotal(), date: Date.now, type: .LIVE)
        
        for item in cart{
            newOrder.addOrderItem(pizza: item)
        }
        
        dataService.addOrder(order: newOrder)
        
        dataService.clearCart()
        
    }
}
