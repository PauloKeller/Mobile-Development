//
//  DessertViewController.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/7/16. Modified 2/1/18
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import UIKit

protocol DessertViewControllerDelegate{
    func didChooseDessert(dessert:OrderItem)
}

class DessertViewController: UIViewController {
    var lastSelection = ""
    var dessert = OrderItem()
    var delegate:DessertViewControllerDelegate! = nil
    @IBOutlet weak var dessertSelection: UILabel!
    
    
    @IBAction func dessertSelectionButton(_ sender: UIButton) {
        dessert.itemName = (sender.titleLabel?.text)!
        dessertSelection.text = dessert.itemName
    }

    @IBAction func backbutton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
   
    
    @IBAction func doneButon(_ sender: UIButton) {
        delegate.didChooseDessert(dessert: dessert)
        navigationController?.popViewController(animated: true)
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dessertSelection.text = lastSelection
    }

    
}
















