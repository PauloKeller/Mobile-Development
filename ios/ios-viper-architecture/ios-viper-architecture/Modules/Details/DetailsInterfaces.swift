//
//  DetailsInterfaces.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 11/05/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsViewInterface: ViewInterface {}

protocol DetailsPresenterInterface: PresenterInterface {
  var navTitle: String { get }
  var post: PostModel { get }
}

enum DetailsNavigationOption {
  case showErrorNoInternetConnection
  case showExceptionError(title: String, message: String, buttonSuccessText: String, doneCallback: () -> Void)
  case genericError(doneCallback: () -> Void)
}

protocol DetailsWireframeInterface: WireframeInterface {
  func navigate(to option: DetailsNavigationOption)
}

protocol DetailsInteractorResponseProtocol: class {
  func networkingNotAvailable()
}

protocol DetailsInteractorProtocol: InteractorInterface {
}
