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
    
    let pizzaDesc:[String] = ["Cheese, Seasoned Grilled Chicken Breast, Green Peppers, Pizza Mozzarella","Sliced Mushrooms, Green Pepper, Red Onion, Tomato and Pizza Mozzarella","Pepperoni, Green Pepper, Sliced Mushrooms, Red Onion and Pizza Mozzarella","Loaded with Mozzarella, Roasted Red Peppers, Green Peppers and Extra Cheese","Double Pepperoni and Extra Pizza Mozzarella, Green Pepper, Sliced Mushrooms, Red Onion","Loaded with Mozzarella, Diced Tomato,Red Onion, Sliced Mushroom and Green Pepper"]
    
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

