//
//  CartTableCell.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-12.
//

import UIKit

class CartTableCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCost: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
