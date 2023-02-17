//
//  ResponseSuccessCallback.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

import UIKit

class ResponseSuccessCallback<T: Decodable> {
  var data: T?
  var responseTime: Date?
  
  private enum ResponseSuccessKeys: String {
    case headerDate = "Date"
  }
  
  init(body: AnyObject?) {

    guard let body = body, let validData = body as? Data else {
      data = nil
      responseTime = nil
      return
    }
    
    // Change to data response key
    data = T.parse(data: validData)
  }
}
