//
//  SessionCustomErrors.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 02/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

enum CustomError {
  static let unauthorizeDevice = "1011"
  static let rootedPhone = "735"
}

enum ErrorCode {
  case unauthorizeDevice
  case rootedPhone
}

protocol SessionCustomErrorsDelegate: class {
  func sendCustomError(code: ErrorCode)
}

class SessionCustomErrors {
  
  weak var customErrorDelegate: SessionCustomErrorsDelegate?
  
  static var sharedInstance = SessionCustomErrors()
  static var isShowingError = false
  
  func getCustomGlobalError(error: Error) -> Error? {
    let err = Response.codeFromError(error: error)
    let code = err.code
    
    if code == CustomError.unauthorizeDevice {
      customErrorDelegate?.sendCustomError(code: .unauthorizeDevice)
      return nil
    } else if code == CustomError.rootedPhone {
      customErrorDelegate?.sendCustomError(code: .rootedPhone)
      return nil
    } else {
      return error
    }
  }
}
