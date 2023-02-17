//
//  File.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 03/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

typealias NetworkingStatus = NetworkReachabilityManager.NetworkReachabilityStatus

enum NetworkResponseType {
  case none
  case cancelTicket(id: Int64)
  case getAddress(zipcode: String)
  case getCity(code: String)
  case getDocument
  case getCountry
  case validateSMS(code: String)
  case updatePhone(phone: String)
  case authenticateUser(login: String, password: String)
  case getPosts
  case getPost(id: Int64)
}

protocol NetworkingInteractorProtocols {
  func check(_ ID: NetworkResponseType)
  func registerListener()
}

protocol NetworkingInteractorResponse {
  func networkingAvailable(_ ID: NetworkResponseType)
  func networkingNotAvailable(_ ID: NetworkResponseType)
}

protocol NetworkingListenerResponse {
  func networkingStatusChanged(status: NetworkingStatus)
}

class NetworkingInteractor {
  var response: NetworkingInteractorResponse?
  var listener: NetworkingListenerResponse?
}

extension NetworkingInteractor: NetworkingInteractorProtocols {
  func registerListener() {
    NetworkManager.shared.listener { status in
      self.listener?.networkingStatusChanged(status: status)
    }
  }
  
  func check(_ ID: NetworkResponseType = .none) {
    if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
      if NetworkManager.shared.isInternetAvailable() {
        response?.networkingAvailable(ID)
      } else {
        response?.networkingNotAvailable(ID)
      }
    } else {
      response?.networkingAvailable(ID)
    }
  }
}
