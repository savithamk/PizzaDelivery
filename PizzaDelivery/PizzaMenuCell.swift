//
//  PizzaMenuCell.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-11.
//

import UIKit

class PizzaMenuCell: UITableViewCell {
    
    @IBOutlet weak var pizzaImage: UIImageView!
    
    @IBOutlet weak var pizzaName: UILabel!
    
    
    @IBOutlet weak var pizzaDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
