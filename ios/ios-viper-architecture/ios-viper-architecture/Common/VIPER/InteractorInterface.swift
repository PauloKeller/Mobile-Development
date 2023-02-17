//
//  InteractorInterface.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 02/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

protocol InteractorInterface: class {
  var networking: NetworkingInteractor { get }
}

extension InteractorInterface {
  var networking: NetworkingInteractor {
    let interactor = NetworkingInteractor()
    interactor.response = self as? NetworkingInteractorResponse
    interactor.listener = self as? NetworkingListenerResponse
    return interactor
  }
}
