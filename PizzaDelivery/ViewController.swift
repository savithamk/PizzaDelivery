//
//  ViewController.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let pizzaImages:[String] = ["cheesy-chicken","garden-veggie","meat-supreme","mushroom","pepperoni","tangy-tomato"]
    let pizzaNames:[String] = ["Cheesy Chicken","Garden Veggie","Meat supreme","Mushroom","Pepperoni","Tangy Tomato"]
    
    let pizzaDesc:[String] = ["Cheesy Chicken,Cheesy Chicken,Cheesy Chicken,Cheesy Chicken","Garden Veggie,Garden Veggie,Garden Veggie,Garden Veggie,Garden Veggie","Meat supreme,Meat supreme,Meat supreme,Meat supreme,Meat supreme","Mushroom,Mushroom,Mushroom,Mushroom,Mushroom,Mushroom","Pepperoni,Pepperoni,Pepperoni,Pepperoni,Pepperoni","Tangy Tomato,Tangy Tomato,Tangy Tomato,Tangy Tomato,Tangy Tomato"]
    
    @IBOutlet weak var pizzaMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.backButtonTitle = ""
        pizzaMenu.register(UINib(nibName: "PizzaMenuCell", bundle: nil), forCellReuseIdentifier: "pizzacell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pizzaNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pizzaMenu.dequeueReusableCell(withIdentifier: "pizzacell", for: indexPath) as! PizzaMenuCell
        
        cell.pizzaName.text = pizzaNames[indexPath.row]
        cell.pizzaImage.image = UIImage(named: pizzaImages[indexPath.row])
        cell.pizzaDesc.text = pizzaDesc[indexPath.row]
        
        return cell
    }


}

