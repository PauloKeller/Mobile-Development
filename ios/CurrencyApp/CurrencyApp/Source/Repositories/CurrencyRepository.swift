//
//  CurrencyRepository.swift
//  CurrencyApp
//
//  Created by paulo on 01/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

protocol Storage {
    func save()
    func load()
}

class CurrencyRepository {
    static let sharedInstance = CurrencyRepository()
    private var reachability: NetworkReachabilityManager!
    private var hasConnection = true
    private let provider = CurrencyProvider()
    private var realm: Realm?
    
    private init() {
        reachability = NetworkReachabilityManager.default
        monitorReachability()
        configRealm()
    }
    
    private func configRealm() {
        do {
            self.realm = try Realm()
        }
        catch {
            fatalError("Could no initialize realm")
        }
    }
    
    private func monitorReachability() {
        reachability.startListening { status in
            let hasAccessPoint = !(status == .notReachable)
            
            if hasAccessPoint {
                self.hasConnection = true
            }
        }
    }
    
    func save(item: QuoteModel) {
        guard let db = self.realm else { return }
        do  {
            try db.write {
                db.add(item)
            }
        } catch {
            print("Error saving context, \(error)")
        }
    }
    
    func save(item: CurrencyModel) {
        guard let db = self.realm else { return }
        do  {
            try db.write {
                db.add(item)
            }
        } catch {
            print("Error saving context, \(error)")
        }
    }
    
    func load() -> [QuoteModel] {
        guard let db = self.realm else { return [] }
        let loadedQuotes = db.objects(QuoteModel.self)
        var quotes: [QuoteModel] = []
        for quote in loadedQuotes {
            quotes.append(quote)
        }
        return quotes
    }
    
    func load(filteredBy query: String? = nil) -> (currencies: [CurrencyModel], wasQueryFail: Bool) {
        guard let db = self.realm else { return ([], true) }
        var wasQueryFail = false
        let loadedCurrencies = db.objects(CurrencyModel.self)
        var currencies: [CurrencyModel] = []
        if let query = query {
            let results = loadedCurrencies.filter("name CONTAINS[cd] %@", query).sorted(byKeyPath: "name", ascending: true)
            for currency in results {
                currencies.append(currency)
            }
            if currencies.count == 0 {
                wasQueryFail = true
            }
        } else {
            for currency in loadedCurrencies {
                currencies.append(currency)
            }
        }
        
        return (currencies, wasQueryFail)
    }
    
    func saveFetched(data: [QuoteModel]?) {
        if let quotes = data {
            for quote in quotes {
                save(item: quote)
            }
        }
    }
    
    func saveFetched(data: [CurrencyModel]?) {
        if let currencies = data {
            for currency in currencies {
                save(item: currency)
            }
        }
    }
    
    func retrieveQuotes(forceFetch: Bool = false, completion: @escaping (_ model: [QuoteModel]?, _ msg: String?) -> Void) -> Void {
        let defaultMsg = "No connection available, plz connect to the internet"
        let quotes: [QuoteModel] = load()
        
        if forceFetch || (quotes.count <= 0) {
            if hasConnection {
                provider.fetchQuotes() { (wasSuccess, model, msg) in
                    if wasSuccess {
                        let quotes = model?.quotes?.map{ QuoteModel(initials: $0.key, value: $0.value, lastQuotation: model?.timestamp ?? 0) }
                        self.saveFetched(data: quotes)
                        completion(quotes, nil)
                    } else {
                        completion(nil, msg)
                    }
                }
            } else {
                completion(nil, defaultMsg)
            }
        } else {
            completion(quotes, nil)
        }
    }
    
    func retrieveCurrencies(filteredBy query: String? = nil, completion: @escaping (_ model: [CurrencyModel]?, _ msg: String?) -> Void) -> Void {
        let defaultMsg = "No connection available, plz connect to the internet"
        let cachResult: ([CurrencyModel],Bool) = load(filteredBy: query)
        let currencies = cachResult.0
        let queryWasFail = cachResult.1
        
        if (currencies.count <= 0) && (!queryWasFail) {
            if hasConnection {
                provider.fetchCurrencies() { (wasSuccess, model, msg) in
                    if wasSuccess {
                        let currencies = model?.currencies?.map{ CurrencyModel(initials: $0.key, name: $0.value) }
                        self.saveFetched(data: currencies)
                        completion(currencies, nil)
                    } else {
                        completion(nil, msg)
                    }
                }
            } else {
                completion(nil, defaultMsg)
            }
        } else {
            completion(currencies, nil)
        }
    }
    
}
