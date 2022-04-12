//
//  CustomizeController.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-11.
//

import UIKit

class CustomizeController: UIViewController {

    let accentColor:UIColor = UIColor(red: 0.91, green: 0.36, blue: 0.02, alpha: 1.00)
    
    var buttonTap = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = ""
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: CustomizeScreenButton) {
        buttonTap = !buttonTap
        if(buttonTap){
            sender.backgroundColor = accentColor
            sender.tintColor = UIColor.white
        }else{
            sender.backgroundColor = UIColor.white
            sender.tintColor = accentColor
        }
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
