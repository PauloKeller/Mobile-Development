//
//  StringExtension.swift
//  CurrencyApp
//
//  Created by paulo on 07/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation

extension String {
    func splitDecimal() -> (integerValue: String, decimalValue: String) {
        let splitedValue = self.split(separator: ".")
        let integerValue = "\(splitedValue[0])"
        let decimalValue = "\(splitedValue[1])"
        return (integerValue, decimalValue)
    }
}
