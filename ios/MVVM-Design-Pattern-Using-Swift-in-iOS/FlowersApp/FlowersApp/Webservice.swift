//
//  Webservice.swift
//  FlowersApp
//
//  Created by Mohammad Azam on 12/14/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

private var url = URL(string: "https://flowers.vapor.cloud/flowers")!

typealias JSONDictionary = [String:Any]

class Flower {
    
    var name :String!
    var description :String!
    
    init?(dictionary :JSONDictionary) {
        
        guard let name = dictionary["name"] as? String,
            let description = dictionary["description"] as? String else {
                return
        }
        
        self.name = name
        self.description = description
    }
}

class Webservice {
    
    func loadFlowers(completion :@escaping ([Flower]) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionaries = json as! [JSONDictionary]
                
                DispatchQueue.main.async {
                  completion(dictionaries.compactMap(Flower.init))
                }
                
            }
            
        }.resume()
        
    }
    
}
