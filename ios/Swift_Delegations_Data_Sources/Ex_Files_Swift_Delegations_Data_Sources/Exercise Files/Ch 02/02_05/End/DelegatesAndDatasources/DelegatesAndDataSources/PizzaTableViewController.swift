//
//  PizzaTableViewController.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/8/16.
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import UIKit




protocol PizzaTableViewControllerDelegate{
   func didSelectPizzaCell(pizza:String)
}

class PizzaTableViewController: UITableViewController {

    let pizzaMenu = PizzaMenu()
    var pizza = String()
    var delegate:PizzaTableViewControllerDelegate! = nil
    
    
    //MARK: - Table View Data Source Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaMenu.menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = pizzaMenu.menu[row].pizzaName
        cell.detailTextLabel?.text = pizzaMenu.menu[row].pizzaDescription
        
        //Making the cell fancy
        
        //font changes
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.detailTextLabel?.backgroundColor = UIColor.clear
        if row % 2 == 0 {
            cell.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        } else {
            cell.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        return cell
    }
    //MARK: - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        pizza = pizzaMenu.menu[row].pizzaName
        delegate.didSelectPizzaCell(pizza: pizza)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //cell is 1/5 the height of super view.
        return view.frame.size.height/5.0
        
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
