//
//  FlowersListViewModel.swift
//  FlowersApp
//
//  Created by Paulo on 28/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class FlowersListViewModel {
  var flowerViewModels: [FlowerViewModel] = []
  
  init (webservice: Webservice, completion: @escaping () -> ()) {
    webservice.loadFlowers { flowers in
      self.flowerViewModels = flowers.map(FlowerViewModel.init)
      DispatchQueue.main.async {
        completion()
      }
    }
  }
  
  func populateFlowers(_ flowers: [Flower]) {
    flowerViewModels = flowers.map(FlowerViewModel.init)
  }
}

class FlowerViewModel {
  var name: String = ""
  var description: String = ""
  
  init (flower: Flower) {
    self.name = flower.name
    self.description = flower.description
  }
}
