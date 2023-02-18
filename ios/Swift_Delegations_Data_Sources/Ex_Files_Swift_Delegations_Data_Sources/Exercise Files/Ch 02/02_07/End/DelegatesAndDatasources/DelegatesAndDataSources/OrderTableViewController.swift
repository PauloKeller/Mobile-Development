//
//  OrderTableViewController.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/7/16.
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import UIKit


class OrderTableViewController: UITableViewController {
    
    var orderedItems = OrderList()
    
    func updateTable(orderList:OrderList){
        orderedItems = orderList
        tableView.reloadData()
    }
    //MARK: - Table Data Sources
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("Number of Rows is \(orderedItems.list.count)")
        return orderedItems.list.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = orderedItems.list[row].itemName
        cell.detailTextLabel?.text = orderedItems.list[row].itemSize
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let noOrder = OrderItem()
        noOrder.itemName = "No Order Yet"
        orderedItems.add(orderItem: noOrder)
    }
    
    
}










