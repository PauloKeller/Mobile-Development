//
//  Source.swift
//  HeadlinesApp
//
//  Created by Mohammad Azam on 12/9/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

class Source {
  
  var id :String
  var name :String
  var description :String
  
  init(id :String, name :String, description :String) {
    self.id = id
    self.name = name
    self.description = description 
  }
  
  init(sourceViewModel: SourceViewModel) {
    self.id = sourceViewModel.id
    self.name = sourceViewModel.name
    self.description = sourceViewModel.description
  }
  
  init?(dictionary :[String:Any]) {
    
    guard let id = dictionary["id"] as? String,
          let name = dictionary["name"] as? String,
          let description = dictionary["description"] as? String else {
      return nil
    }
    
    self.id = id
    self.name = name
    self.description = description
  }
}


