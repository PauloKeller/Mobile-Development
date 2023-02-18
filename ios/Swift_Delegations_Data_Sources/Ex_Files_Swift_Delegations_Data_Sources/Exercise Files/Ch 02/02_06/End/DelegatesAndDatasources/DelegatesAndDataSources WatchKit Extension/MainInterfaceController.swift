//
//  MainInterfaceController.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/13/16.
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import WatchKit
import Foundation


class MainInterfaceController: WKInterfaceController {
    var orderItem = OrderItem()
    @IBOutlet var dessertSelectionLabel: WKInterfaceLabel!
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        var context:[String:Any]! = nil
        if segueIdentifier == "dessert"{
            context = ["selection":"Desserts"]
        }
        return context
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
}
