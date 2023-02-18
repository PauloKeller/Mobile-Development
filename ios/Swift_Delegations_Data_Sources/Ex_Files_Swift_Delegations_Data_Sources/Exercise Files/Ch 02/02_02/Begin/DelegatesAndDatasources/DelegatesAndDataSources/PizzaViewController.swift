//
//  PizzaViewController.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/7/16.
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import UIKit

protocol PizzaViewControllerDelegate{
    func didSelectPizza(pizza:OrderItem)
}

class PizzaViewController: UIViewController, PizzaTableViewControllerDelegate {
    
    var pizza = OrderItem()
    var delegate:PizzaViewControllerDelegate! = nil
    @IBOutlet weak var lastOrderLabel: UILabel!
    @IBOutlet weak var pizzaView: UIView!
    
    @IBAction func backbutton(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func doneButon(_ sender: UIButton) {
        delegate.didSelectPizza(pizza: pizza)
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "pizza table"{
                let vc = segue.destination as! PizzaTableViewController
                vc.delegate = self
        }
    }
    // MARK: - Delegate
    func didSelectPizzaCell(pizza: String) {
        self.pizza.itemName = pizza
    }
    

}
