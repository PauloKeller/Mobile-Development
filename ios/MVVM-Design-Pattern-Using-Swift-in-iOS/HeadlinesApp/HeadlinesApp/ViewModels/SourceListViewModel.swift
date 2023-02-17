//
//  SourceListViewModel.swift
//  HeadlinesApp
//
//  Created by Paulo on 29/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class SourceListViewModel {
  private var webservice: Webservice
  private (set) var sourcesViewModel: [SourceViewModel] = []
  private var completion: () -> () = { }
  
  init (webservice: Webservice, completion: @escaping () -> ()) {
    self.webservice = webservice
    self.completion = completion
    populateSources()
  }
  
  private func populateSources() {
    webservice.loadSources { sources in
      self.sourcesViewModel = sources.map(SourceViewModel.init)
      self.completion()
    }
  }
  
  func sourceAt(index: Int) -> SourceViewModel {
    return sourcesViewModel[index]
  }
}
