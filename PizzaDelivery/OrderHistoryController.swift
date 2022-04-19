//
//  OrderHistoryController.swift
//  PizzaDelivery
//
//  Created by Savitha M K on 2022-04-18.
//

import UIKit

class OrderHistoryController: UITableViewController {

    let orderCellIdentifier:String = "orderCell";
    
    let orderSections:[String] = ["In Progress","Completed","Cancelled"]
    
    let dateFormatter = DateFormatter()
    
    var orders:[String:[Order]]!
    
    let dataService:DataService = DataService.dataManager
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(goToHome)), animated: true)
        
        dateFormatter.locale = Locale(identifier: "en_CA")
        dateFormatter.setLocalizedDateFormatFromTemplate("M/d/y")
        
        fetchData()
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return orderSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orders[orderSections[section]]?.count ?? 0
    }
    
    @objc func goToHome(_ sender: Any){
        dataService.updateOrders()
        performSegue(withIdentifier: "unwindToHomeController", sender: self)
    }
    
    
    func getSectionName(indexPath:IndexPath) -> String {
        return orderSections[indexPath.section]
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: orderCellIdentifier, for: indexPath) as! OrderTableCell

        let relevantOrders = orders[getSectionName(indexPath:indexPath)]!
        
        let orderForCell = relevantOrders[indexPath.row]
        
        var orderItemNames:[String] = []
        
        for o in orderForCell.orderItems {
            orderItemNames.append(o.name)
        }
        
        cell.orderAmount.text = String(format: "%.2f", orderForCell.orderAmount)
        cell.orderItems.text = orderItemNames.joined(separator: ",")
        cell.orderDate.text = dateFormatter.string(from: orderForCell.orderDate)
        cell.type = orderForCell.orderType
        cell.orderActionBtn.layer.name = orderForCell.orderId
        if(orderForCell.orderType == .LIVE){
            cell.orderActionBtn.setImage(UIImage(named: "cancel"), for: .normal)
            cell.orderRightView.backgroundColor  = UIColor.systemOrange
            cell.orderActionBtn.addTarget(self, action: #selector(cancelOrder), for: .touchUpInside)
        }else {
            cell.orderActionBtn.setImage(UIImage(named:"trash"), for: .normal)
            cell.orderRightView.backgroundColor = UIColor.red
            cell.orderActionBtn.addTarget(self, action: #selector(deleteOrder), for: .touchUpInside)
        }
        
        cell.orderActionBtn.tintColor = UIColor.white

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return orderSections[section]
    }
    
    override func tableView(_ tableView: UITableView,
               heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func fetchData(){
        orders = dataService.fetchOrders()
    }
    
    @objc func cancelOrder(sender:UIButton!){
        dataService.cancelOrder(uuid: sender.layer.name!)
        fetchData()
        tableView.reloadData()
    }
    
    @objc func deleteOrder(sender:UIButton!){
        dataService.deleteOrder(uuid: sender.layer.name!)
        fetchData()
        tableView.reloadData()
    }

}
