//
//  OrderList.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/8/16.
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import UIKit


class OrderItem{
    var itemName = ""
    var itemSize = ""
    private let spaceString = " "
    func itemString()-> String{
        return itemSize + spaceString + itemName
    }
}


class OrderList{
    var list:[OrderItem] = []
    var lastSelection = "None"
    func add(orderItem:OrderItem){
        list += [orderItem]
        lastSelection = orderItem.itemString()
    }
    func add(name:String, size:String){
        let item = OrderItem()
        item.itemName = name
        item.itemSize = size
        list += [item]
        lastSelection = item.itemString()
    }
    
}
