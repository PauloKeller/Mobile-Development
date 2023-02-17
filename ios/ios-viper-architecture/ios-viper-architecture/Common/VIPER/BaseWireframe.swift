//
//  BaseWireframe.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 02/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation
import UIKit

enum Transition {
  case root
  case push
  case pushEnd(hidesBackButton: Bool)
  case pushFromBottom
  case stack(viewControllers: [UIViewController])
  case present(fromViewController: UIViewController)
  case presentBottomSheet
  case presentSelf
  case presentDefault
  case stackLogin
  case stackHome
}

protocol WireframeInterface: class {
  func popToRoot(_ animated: Bool)
  func popToViewController(viewController: UIViewController, animated: Bool)
  func popFromNavigationController(animated: Bool)
  func dismiss(animated: Bool)
  func popSessionExpired()
}

class BaseWireframe {
  
  weak var navigationController: UINavigationController!
  weak var tabBarController: UITabBarController?
  
  weak private var popGesture: UIGestureRecognizer?
  
  private var transition = CATransition()
    
  required init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    
    if let gesture = self.popGesture {
      self.navigationController!.view.addGestureRecognizer(gesture)
    }
  }
  
  fileprivate func removePopGesture() {
    if navigationController!.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
      self.popGesture = navigationController!.interactivePopGestureRecognizer
      self.navigationController!.view.removeGestureRecognizer(navigationController!.interactivePopGestureRecognizer!)
    }
  }
  
  func show(_ viewController: UIViewController, with transition: Transition, animated: Bool) {
    
    SessionCustomErrors.sharedInstance.customErrorDelegate = self
    
    switch transition {
      
    case .push:
      navigationController.pushViewController(viewController, animated: animated)
      removePopGesture()
      
    case .pushEnd(let hidesBackButton):
      navigationController.pushViewController(viewController, animated: animated)
      navigationController.setNavigationBarHidden(hidesBackButton, animated: true)
      removePopGesture()
    
    case .pushFromBottom:
      self.transition.duration = 0.5
      self.transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
      self.transition.type = CATransitionType.push
      self.transition.subtype = CATransitionSubtype.fromTop
      self.navigationController.view.layer.add(self.transition, forKey: kCATransition)
      self.navigationController.pushViewController(viewController, animated: false)
      
      removePopGesture()
      
    case .present(let fromViewController):
      navigationController.viewControllers = [viewController]
      fromViewController.present(navigationController, animated: animated, completion: nil)
      
    case .root:
      navigationController.setViewControllers([viewController], animated: animated)
      
    case .stack(let viewControllers):
      let stack = viewControllers + [viewController]
      navigationController.setViewControllers(stack, animated: animated)
      
    case .presentSelf:
      viewController.modalPresentationStyle = .overCurrentContext
      viewController.modalTransitionStyle = .crossDissolve
      navigationController.present(viewController, animated: true)
      
    case .presentDefault:
      navigationController.present(viewController, animated: true)
      
    case .presentBottomSheet:
      viewController.modalPresentationStyle = .overFullScreen
      viewController.modalTransitionStyle = .coverVertical
      navigationController.present(viewController, animated: true)
    
    case .stackLogin:
      fatalError("Implementation pending...")
      
    case .stackHome:
      let homeModule = HomeWireframe(navigationController: navigationController)
      homeModule.show(with: .root, animated: false)
      if let tabController = homeModule.tabBarController {
        let stack = [tabController] + [viewController]
        navigationController.setViewControllers(stack, animated: animated)
      }
    }
    
    SessionManager.sharedInstance.setsetSessionStateResponse(sessionManagerStateResponse: self)
  }
  
  func showAlert() {
    fatalError("Implementation pending...")
  }
  
  func showModalDialogNoInternetConnection(doneCallback: @escaping () -> Void) {
    fatalError("Implementation pending...")
  }
  
  func showModalDialogGenericError(doneCallback: @escaping () -> Void) {
    fatalError("Implementation pending...")
  }
  
  private func goToLogin() {
    fatalError("Implementation pending...")
  }
  
  private func showAlertDeviceNotAuthorization() {
    fatalError("Implementation pending...")
  }

  private func showAlertUnexpectedError() {
    fatalError("Implementation pending...")
  }
  
}

extension BaseWireframe: WireframeInterface {
  func popToRoot(_ animated: Bool) {
    _ = navigationController.popToRootViewController(animated: animated)
  }
  
  func popToViewController(viewController: UIViewController, animated: Bool) {
    _ = navigationController.popToViewController(viewController, animated: animated)
  }
  
  func popFromNavigationController(animated: Bool) {
    _ = navigationController.popViewController(animated: animated)
  }
  
  func dismiss(animated: Bool) {
    if navigationController != nil {
      navigationController.dismiss(animated: animated)
    }
  }
  
  func popSessionExpired() {
    fatalError("Implementation pending...")
  }
}

extension BaseWireframe: SessionManagerStateResponse {
  func sessionExpired() {
    DispatchQueue.main.async(execute: {
      self.popSessionExpired()
    })
  }
}

extension BaseWireframe: SessionCustomErrorsDelegate {
  func sendCustomError(code: ErrorCode) {
    if SessionCustomErrors.isShowingError { return }
    SessionCustomErrors.isShowingError = true

    switch code {
    case .unauthorizeDevice:
      self.showAlertDeviceNotAuthorization()
    case .rootedPhone:
      self.showAlertUnexpectedError()
    }
  }
}
