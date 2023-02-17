//
//  Response.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 14/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

protocol ResponseProtocol {
  static func fillWithDictionary<T>(_ variable: inout T, key: String, dictionary: [String : Any])
}

struct Response: Error {

  fileprivate static let kPEP = "PEP"
  fileprivate static let kPeopleOn = "Pessoa Ligada"

  // MARK: - Properties

  var erros:[ResponseError] = []
  var seed:String = ""
  var responseCode:Int = -1
  var deviceKey = ""
  var deviceId = ""
  var accountNumber = ""
  var situation = ""
  var statusOnboarding = ""
  var salesForce: [String: Any] = [:]
  var docInfo: [String: Any] = [:]
  var resultCode: Int = 0
  var operationResult: String = ""
  var status: String = ""

  // MARK: - Keys

  enum CodingKeys {
    static let erros = "erros"
    static let code = "status-code"

    enum Marketing {
      static let contactId = "contactId"
      static let leadId = "leadId"
    }
  }
  
  enum GenericCodes {
    static let kCodeApple = "APPLE"
  }
  
  // MARK: - Parser
  
  init?(response: [String: Any]) {
    if let statusCode:Int = response[CodingKeys.code] as? Int {
      self.responseCode = statusCode
    }
    
    guard let dicErrorArray = response[CodingKeys.erros] as? [[String : Any]] else {
      return
    }
    
    var erros:[ResponseError] = []
    
    for error in dicErrorArray {
      
      guard let errorObj = ResponseError(dic: error) else {
        return
      }
      
      erros.append(errorObj)
    }
    
    self.erros = erros
  }
  
  private static func convertStringJSONToDictionary(json: String) -> [String: Any]? {
    if let data = json.data(using: .utf8) {
      do {
        return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
      } catch {
        print(error.localizedDescription)
      }
    }
    return nil
  }
}

extension Response {
  
  // MARK: - Helper Methods

  /// Parse response errors
  ///
  /// - Parameter error: Error type from response
  /// - Returns: return tuple of code and description for error
  static func codeFromError(error: Error) -> (code: String?, description: String?, parameter: [String: Any]?) {
    if let error = error as? ResponseError {
      return (error.code, error.errorDescription, error.parameter)
    }
    
    if let userInfo = error._userInfo,
      let info = userInfo as? [String: Any],
      let errorObj = Response(response: info) {
      return (errorObj.erros.first?.code, errorObj.erros.first?.errorDescription, errorObj.erros.first?.parameter)
    }
    
    return (nil, nil, nil)
  }
  
  static func codesFromErrors(error: Error) -> [ResponseError] {
    if let userInfo = error._userInfo,
      let info = userInfo as? [String: Any],
      let errorObj = Response(response: info) {
      return errorObj.erros
    }
    
    return []
  }
}

extension ResponseProtocol {
  
  static func fillWithDictionary<T>(_ variable: inout T, key: String, dictionary: [String : Any]) {
    if let tempField = dictionary[key] as? T {
      variable = tempField
    }
  }
}

struct ResponseError: Error {
  
  // MARK: - Properties
  
  var code: String = "-1"
  var errorDescription: String = ""
  var detail: String = ""
  var parameter: [String: Any]?
  
  // MARK: - Keys
  
  enum CodingKeys {
    static let code = "codigo"
    static let errorDescription = "mensagem"
    static let detail = "detalhe"
    static let parameter = "parametro"
  }
  
  init?(dic: [String: Any]) {
    
    let code = dic[CodingKeys.code] as? String ?? "-1"
    let errorDescription = dic[CodingKeys.errorDescription] as? String ?? ""
    let detail = dic[CodingKeys.detail] as? String ?? ""
    let parameter = dic[CodingKeys.parameter] as? [String: Any] ?? [:]
    
    self.code = code
    self.detail = detail
    self.errorDescription = errorDescription
    self.parameter = parameter
  }
}
