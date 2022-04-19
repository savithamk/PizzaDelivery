//
//  CustomizeController.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-11.
//

import UIKit

class CustomizeController: UIViewController {

    var sizes:[Int:Size] = [:]
    var crusts:[Int:Crust] = [:]
    var sauces:[Int:Sauce] = [:]
    var toppings:[Int:Topping] = [:]
    
    var selectedPizza:Pizza!
    
    var customizedPizza: FinalizedPizza!
    
    let accentColor:UIColor = UIColor(red: 0.91, green: 0.36, blue: 0.02, alpha: 1.00)
    
    var tappedButtons:[Int] = []
    
    let dataService:DataService = DataService.dataManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = ""
        customizedPizza = FinalizedPizza(Id: selectedPizza.Id, name: selectedPizza.name, fullDescription: selectedPizza.fullDescription, imageRefName: selectedPizza.imageRefName)
        sizes = dataService.availableSizes()
        crusts = dataService.availableCrusts()
        sauces = dataService.availableSauces()
        toppings = dataService.availableToppings()
    }
    
    
    @IBAction func buttonTapped(_ sender: CustomizeScreenButton) {
        
        if tappedButtons.contains(sender.tag) {
            sender.backgroundColor = UIColor.white
            sender.tintColor = accentColor
            let idx = tappedButtons.firstIndex(of: sender.tag)
            tappedButtons.remove(at: idx!)
        }else {
            sender.backgroundColor = accentColor
            sender.tintColor = UIColor.white
            tappedButtons.append(sender.tag)
        }
       
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        for tag in tappedButtons {
            if (tag >= 0 && tag <= 3) {
                customizedPizza.size = sizes[tag]!
            } else if (tag >= 4 && tag <= 5) {
                customizedPizza.crust = crusts[tag]!
            } else if (tag >= 6 && tag <= 8) {
                customizedPizza.sauce = sauces[tag]!
            } else if (tag >= 9 && tag <= 20) {
                customizedPizza.addTopping(topping: toppings[tag]!)
            }
        }
        
        dataService.addToCart(pizza: customizedPizza)
    }
}
