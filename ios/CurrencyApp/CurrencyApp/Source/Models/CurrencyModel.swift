//
//  CurrencyModel.swift
//  CurrencyApp
//
//  Created by paulo on 01/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation
import RealmSwift

struct FetchQuotesResponse: Decodable {
    let source: String?
    let timestamp: Int?
    let quotes: [String: Float32]?
}

struct FetchCurrenciesResponse: Decodable {
    let currencies: [String: String]?
}

class QuoteModel: Object {
    @objc dynamic var initials: String = ""
    @objc dynamic var value: Float32 = 0
    @objc dynamic var lastQuotation: Int = 0
    
    convenience init(initials:String, value: Float32, lastQuotation: Int) {
        self.init()
        self.initials = initials
        self.value = value
        self.lastQuotation = lastQuotation
    }
}

class CurrencyModel: Object {
    @objc dynamic var initials: String = ""
    @objc dynamic var name: String = ""
    
    convenience init(initials:String, name: String) {
        self.init()
        self.initials = initials
        self.name = name
    }
}

