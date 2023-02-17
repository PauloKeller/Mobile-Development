//
//  HeadlineListViewModel.swift
//  HeadlinesApp
//
//  Created by Paulo on 29/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class HeadlineListViewModel {
  private (set) var headlineViewModels: [HeadlineViewModel] = []
  
  init(sourceViewModel: SourceViewModel, completion: @escaping () -> ()) {
    let source = Source(sourceViewModel: sourceViewModel)
    
    Webservice().loadHeadLineForSource(source: source) { headlines in
      self.headlineViewModels = headlines.compactMap(HeadlineViewModel.init)
  
      DispatchQueue.main.async {
        completion()
      }
    }
  }
}
