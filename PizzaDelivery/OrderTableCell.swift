//
//  OrderTableCell.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-18.
//

import UIKit

class OrderTableCell: UITableViewCell {

    @IBOutlet weak var orderAmount: UILabel!
    @IBOutlet weak var orderItems: UILabel!
    @IBOutlet weak var orderDate: UILabel!
 
    @IBOutlet weak var orderRightView: UIView!
    
    @IBOutlet weak var orderActionBtn: UIButton!
    var type:OrderType!
}
