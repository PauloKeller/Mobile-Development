//
//  HomeWireframe.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 17/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

final class HomeWireframe: BaseWireframe {
  
  // MARK: - Private properties
  
  private let moduleViewController = HomeViewController(nibName: nil, bundle: nil)
  
  // MARK: - Module setup
  
  func configureModule(with viewController: HomeViewController) {
    let domain = PostsDomain(provider: JsonPlaceHolderProvider())
    let interactor = HomeInteractor(domain: domain)
    let presenter = HomePresenter(wireframe: self, view: viewController, interactor: interactor)
    
    viewController.presenter = presenter
    interactor.delegate = presenter
    domain.responsePosts = interactor
    domain.responsePost = interactor
  }
  
  // MARK: - Transitions
  
  func show(with transition: Transition, animated: Bool = true) {
    configureModule(with: moduleViewController)
    show(moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing
  
  private func showErrorNoInternetConnection() {
    showModalDialogNoInternetConnection(doneCallback: {})
  }
  
  private func showExceptionError(title: String, message: String, buttonSuccessText: String, doneCallback: @escaping () -> Void) {
    fatalError("Implementation pending...")
  }
  
  private func goToDetails(post: PostModel) {
    DetailsWireframe(navigationController: navigationController).show(with: .push, post: post)
  }
}

// MARK: - Extensions

extension HomeWireframe: HomeWireframeInterface {
  func navigate(to option: HomeNavigationOption) {
    switch option {
    case .showExceptionError(title: let title, message: let message, buttonSuccessText: let buttonSuccessText, let doneCallback):
      showExceptionError(title: title, message: message, buttonSuccessText: buttonSuccessText, doneCallback: doneCallback)
    case .showErrorNoInternetConnection:
      showErrorNoInternetConnection()
    case .genericError(let doneCallback):
      showModalDialogGenericError(doneCallback: doneCallback)
    case .goToDetails(let post):
      goToDetails(post: post)
    }
  }
}
