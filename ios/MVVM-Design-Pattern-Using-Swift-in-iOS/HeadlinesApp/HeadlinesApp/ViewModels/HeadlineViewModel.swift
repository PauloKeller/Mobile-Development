//
//  HeadlineViewModel.swift
//  HeadlinesApp
//
//  Created by Paulo on 29/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class HeadlineViewModel {
  var title :String!
  var description :String!
  
  init(headline: Headline) {
    self.title = headline.title
    self.description = headline.description
  }
  
  init(title: String, description: String) {
    self.title = title
    self.description = description
  }
}
