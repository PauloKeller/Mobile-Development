//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
    
    var currencySelected = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencySelected = currencySymbolArray[row]
        finalURL = "\(baseURL)\(currencyArray[row])"
        
        getBitcoinData(url: finalURL)
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    func getBitcoinData(url: String) {
        AF.request(url, method: .get)
            .responseJSON { response in
                switch(response.result) {
                case .success(let value):
                    print("Sucess! Got the bitcoin data")
                    let bitcoinJSON = JSON(value)
                    print(bitcoinJSON)

                    self.updateBitcoinData(json: bitcoinJSON)
                    break
                case .failure(let error):
                    print("Error: \(String(describing: error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                    break
                }
            }

    }

    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    func updateBitcoinData(json : JSON) {
        if let bitcoinResult = json["ask"].double {
            bitcoinPriceLabel.text = "\(currencySelected)\(bitcoinResult)"
        } else {
            bitcoinPriceLabel.text = "Bitcoin Unavailable"
        }
    }
}

