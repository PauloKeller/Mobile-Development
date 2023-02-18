//
//  DessertsInterfaceController.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/13/16. Modified 2/1/18
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import WatchKit
import Foundation

protocol DessertsInterfaceControllerDelegate{
    func didFinishSelectingDessert(item:OrderItem)
}

class DessertsInterfaceController: WKInterfaceController {
    
    var orderItem = OrderItem()
    var delegate:DessertsInterfaceControllerDelegate! = nil
    @IBOutlet var selectedLabel: WKInterfaceLabel!
    @IBAction func mangoKeyLimeButton() {
        buttonPressed(title: "Mango Key Lime Pie")
    }
    
    @IBAction func dukePieButton() {
        buttonPressed(title: "Duke Pie")
    }
    @IBAction func hulaHotFudgeButton() {
        buttonPressed(title: "Hula Hot Fudge")
    }
    @IBAction func chocolateSurfing() {
        buttonPressed(title: "Chocolate Surfing")
    }
    
    func buttonPressed(title:String){
        orderItem.itemName = title
        selectedLabel.setText(title)
        delegate.didFinishSelectingDessert(item: orderItem)
        pop()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        if let contextDictionary = context as? [String:Any]{
            if let selection = contextDictionary["selection"] as? String{
                selectedLabel.setText(selection)
            }
            if let delegate = contextDictionary["delegate"] as? DessertsInterfaceControllerDelegate{
                self.delegate = delegate
            }
        }
    }

}








