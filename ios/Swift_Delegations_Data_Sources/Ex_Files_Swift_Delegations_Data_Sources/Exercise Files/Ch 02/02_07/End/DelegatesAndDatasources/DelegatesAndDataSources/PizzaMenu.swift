//
//  PizzaTableModel.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/8/16.
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import UIKit

class PizzaMenuItem{
    var pizzaName:String
    var pizzaDescription:String
    
    init(name:String,description:String){
        self.pizzaName = name
        self.pizzaDescription = description
    }
}


class PizzaMenu{
    var menu:[PizzaMenuItem]
    init(){
        menu = [PizzaMenuItem(
            name: "Huli Chicken",
            description: "Our street take on the BBQ Chicken Pizza")]
        menu += [PizzaMenuItem(
            name: "Surfboard",
            description: "Local seafood on a longboard crust")]
        menu += [PizzaMenuItem(
            name: "Spam City",
            description: "Spam and Pineapple on a tomato cheese base")]
        menu += [PizzaMenuItem(
            name: "Sweet Home Chicago",
            description: "Sausage and pepperoni Deep Dish pizza")]
        menu += [PizzaMenuItem(
            name: "Vegan Deep Diver",
            description: "Deep dish vegan pizza wth soy cheese")]
        menu += [PizzaMenuItem(
            name: "Big Island",
            description: "36\" pizza with pizza sauce volcano")]
    }
}
