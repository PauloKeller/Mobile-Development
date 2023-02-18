//
//  BeverageViewController.swift
//  DelegatesAndDataSources
//
//  Created by Steven Lipton on 12/7/16. Modified 2/1/18
//  Copyright © 2016 Steven Lipton. All rights reserved.
//

import UIKit

protocol BeverageViewControllerDelegate{
    func didChooseBeverage(beverage:OrderItem)
}

class BeverageViewController: UIViewController,UIPickerViewDelegate {
    
    private var pickerComponents:[[String]] = []
    var delegate:BeverageViewControllerDelegate! = nil
    var beverage = OrderItem()
    let beverageSizes = ["Small","Regular","Large","Jumbo"]
    let beverageNames = ["100% Kona Coffee","Mochaccino","Cappuchino","Night Watch(Coke & Coffee)","Coke","Root Beer","Limonada","Iced Tea","Lilikoi Juice"]
    
    
    @IBOutlet weak var beveragePicker: UIPickerView!
    
    @IBAction func backbutton(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButon(_ sender: UIButton) {
        delegate.didChooseBeverage(beverage: beverage)
        _ = navigationController?.popViewController(animated: true)
    }
    //MARK: - Picker View Data Sources
    
    
    //MARK: - Picker View Delegates
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //using row and componenet data
        if component == 0 { //size
            beverage.itemSize = pickerComponents[component][row]
        }
        if component == 1 { //Beverage name
            beverage.itemName = pickerComponents[component][row]
        }
        
        //for a complete string each time
         beverage.itemSize = pickerComponents[0][pickerView.selectedRow(inComponent: 0)]
        beverage.itemName = pickerComponents[1][pickerView.selectedRow(inComponent: 1)]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Picker delegates and data sources
        beveragePicker.delegate = self
        pickerComponents = [beverageSizes,beverageNames]
    }
}















