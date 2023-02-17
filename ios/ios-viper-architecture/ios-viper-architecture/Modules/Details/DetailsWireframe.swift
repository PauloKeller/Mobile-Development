//
//  DetailsWireframe.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 06/05/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

class DetailsWireframe: BaseWireframe {
  
  // MARK: - Private properties
  
  private let moduleViewController = DetailsViewController(nibName: nil, bundle: nil)
  
  // MARK: - Module setup
  
  func configureModule(with viewController: DetailsViewController, post: PostModel) {
    let presenter = DetailsPresenter(wireframe: self, view: viewController,  post: post)
    
    viewController.presenter = presenter
  }
  
  // MARK: - Transitions
  
  func show(with transition: Transition, animated: Bool = true, post: PostModel) {
    configureModule(with: moduleViewController, post: post)
    show(moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing
  
  private func showErrorNoInternetConnection() {
    showModalDialogNoInternetConnection(doneCallback: {})
  }
  
  private func showExceptionError(title: String, message: String, buttonSuccessText: String, doneCallback: @escaping () -> Void) {
    fatalError("Implementation pending...")
  }
}

// MARK: - Extensions

extension DetailsWireframe: DetailsWireframeInterface {
  func navigate(to option: DetailsNavigationOption) {
    switch option {
    case .showExceptionError(title: let title, message: let message, buttonSuccessText: let buttonSuccessText, let doneCallback):
      showExceptionError(title: title, message: message, buttonSuccessText: buttonSuccessText, doneCallback: doneCallback)
    case .showErrorNoInternetConnection:
      showErrorNoInternetConnection()
    case .genericError(let doneCallback):
      showModalDialogGenericError(doneCallback: doneCallback)
    }
  }
}
