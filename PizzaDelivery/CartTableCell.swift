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
    @IBOutlet weak var deleteItem: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        // super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
