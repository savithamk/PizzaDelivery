//
//  CustomizeScreenButton.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-11.
//

import UIKit

class CustomizeScreenButton: UIButton {

    let accentColor:UIColor = UIColor(red: 0.91, green: 0.36, blue: 0.02, alpha: 1.00)
    
    required init?(coder btnDecoder:NSCoder) {
        super.init(coder: btnDecoder)
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = accentColor.cgColor
        setTitleColor(accentColor, for: .normal)
    }

}
