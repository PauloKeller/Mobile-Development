//
//  DetailsPresenter.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 11/05/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

final class DetailsPresenter {
  // MARK: - Private properties
  private enum Strings {
    static let title = "Details"
  }
  
  private weak var view: DetailsViewInterface?
  private weak var wireframe: DetailsWireframeInterface?
  let post: PostModel
  
  let navTitle = Strings.title
  
  // MARK: - Lifecycle
  
  init(wireframe: DetailsWireframeInterface, view: DetailsViewInterface, post: PostModel) {
    self.wireframe = wireframe
    self.view = view
    self.post = post
  }
}

extension DetailsPresenter: DetailsPresenterInterface {
  
}
