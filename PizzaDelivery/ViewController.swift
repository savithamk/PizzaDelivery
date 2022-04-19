//
//  ViewController.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var offerings:[Pizza] = []
    
    let dataService:DataService = DataService.dataManager
    
    @IBOutlet weak var pizzaMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.backButtonTitle = ""
        offerings = dataService.availableOfferings()
        pizzaMenu.register(UINib(nibName: "PizzaMenuCell", bundle: nil), forCellReuseIdentifier: "pizzacell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        offerings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pizzaMenu.dequeueReusableCell(withIdentifier: "pizzacell", for: indexPath) as! PizzaMenuCell
        
        cell.pizzaName.text = offerings[indexPath.row].name
        cell.pizzaImage.image = UIImage(named: offerings[indexPath.row].imageRefName)
        cell.pizzaDesc.text = offerings[indexPath.row].fullDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "customize", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != "myorders"{
            
            let dst = segue.destination as! CustomizeController
            if sender is Int{
                let senderRow: Int = sender as! Int
                dst.selectedPizza = offerings[senderRow]
            }else {
                dst.selectedPizza = Pizza(Id: 0, name: "Custom", fullDescription: "Create Your Own", imageRefName: "garden-veggie")
            }
        }
        
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        //This  function must not be removed for the unwinding to work
    }

}

