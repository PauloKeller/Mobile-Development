//
//  ColorChooser.swift
//  
//
//  Created by Steven Lipton on 2/1/18.
//

import UIKit

class ColorChooserVC:UIViewController{
    var colors = Colors()
    var currentColor = 0
    @IBAction func chooser(sender:UISegmentedControl){
        currentColor = sender.selectedSegmentIndex
        view.backgroundColor = colors.color(currentColor)
    }
    override func viewDidLoad() {
        let chooser = UISegmentedControl(items: colors.colorName)
        chooser.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        chooser.addTarget(self, action: #selector(chooser(sender:)), for: .valueChanged)
        chooser.tintColor = UIColor.black
        view.addSubview(chooser)
        view.backgroundColor = colors.color(currentColor)
    }
}

