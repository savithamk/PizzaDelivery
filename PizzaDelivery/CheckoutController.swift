//
//  CheckoutController.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-12.
//

import UIKit

class CheckoutController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    let cartItemCellIdentifier = "cartItemCell"
    
    var cartItemImages:[String] = ["garden-veggie","mushroom"]
    var cartItemNames:[String] = ["Garden Veggie","Mushroom"]
    
    var cartCost:[Int] = [2399,2599]

    @IBOutlet weak var cartTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backButtonTitle = ""
        cartTable.register(UINib(nibName: "CartTableCell", bundle: nil), forCellReuseIdentifier: "cartItemCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItemImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTable.dequeueReusableCell(withIdentifier: "cartItemCell", for: indexPath) as! CartTableCell
        
        cell.itemImage.image = UIImage(named: cartItemImages[indexPath.row])
        cell.itemName.text = cartItemNames[indexPath.row]
        
        cell.itemCost.text = String(Float(cartCost[indexPath.row]/100))
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
