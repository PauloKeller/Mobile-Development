//
//  MainViewController.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/7/16. Modified 2/1/18
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,BeverageViewControllerDelegate, PizzaViewControllerDelegate, DessertViewControllerDelegate {
    
    
    @IBOutlet weak var orderView: UIView!
    var orderedItems = OrderList()
    var orderTableVC = OrderTableViewController()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderedItems.add(name: "Huli Chips", size: "Small")
        orderTableVC.updateTable(orderList: orderedItems)
    }

    //MARK: - Delegates and Data Sources
    
    func didChooseDessert(dessert: OrderItem) {
        orderedItems.add(orderItem: dessert)
        orderTableVC.updateTable(orderList: orderedItems)
    }
    
    func didChooseBeverage(beverage: OrderItem) {
        orderedItems.add(orderItem: beverage)
        orderTableVC.updateTable(orderList: orderedItems)
        
        
    }
    
    func didSelectPizza(pizza: OrderItem) {
        orderedItems.add(orderItem: pizza)
        orderTableVC.updateTable(orderList: orderedItems)
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "desserts"{
            let vc = segue.destination as! DessertViewController
            vc.lastSelection = orderedItems.lastSelection
            vc.delegate = self
        }
        
        if segue.identifier == "beverage"{
            let beverageViewController = segue.destination as! BeverageViewController
            beverageViewController.delegate = self
        }
        
        if segue.identifier == "order table"{ //embedded view -- keep controller around
            orderTableVC = segue.destination as! OrderTableViewController
        }
        
        if segue.identifier == "pizza"{
            let pizzaViewController = segue.destination as! PizzaViewController
            pizzaViewController.delegate = self
        }
        
        
    }
}























