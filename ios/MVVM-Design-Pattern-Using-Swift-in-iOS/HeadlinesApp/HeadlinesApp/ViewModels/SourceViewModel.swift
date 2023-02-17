//
//  SourceViewModel.swift
//  HeadlinesApp
//
//  Created by Paulo on 29/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class SourceViewModel {
  var id :String
  var name :String
  var description :String
  
  init(source: Source) {
    self.id = source.id
    self.name = source.name
    self.description = source.description
  }
  
  init(id :String, name :String, description :String) {
    self.id = id
    self.name = name
    self.description = description
  }
}
