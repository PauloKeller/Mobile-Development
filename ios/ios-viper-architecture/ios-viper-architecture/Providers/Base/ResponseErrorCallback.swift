//
//  ResponseErrorCallback.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

class ResponseErrorCallback: Swift.Error {
  var errors: [ErrorResponseModel]?
  var responseTime: Date?
  var statusCode: Int?
  var description: String?
  var status: String?
  
  private enum ResponseErrorKeys {
    static let arrayErrors: String = "erros"
    static let statusCode: String = "status-code"
    static let headerDate: String = "Date"
    static let description: String = "NSLocalizedDescription"
    static let status:String = "status"
  }
  
  init(_ error: Error?) {
    guard let error = error, let userInfo = error._userInfo, let info = userInfo as? [String: Any] else {
      return
    }
    
    responseTime = info.first(where: {$0.key == "time" }).map({
      if let headers = $0.value as? [String: Any],
        let textDate: String = headers[ResponseErrorKeys.headerDate] as? String {
        let convertedDate = textDate.formatISO8601ToDate ?? Date()
        return convertedDate
      }
      return Date()
    })
    
    errors = info.first(where: {$0.key == "errors" }).map({
      if let response = $0.value as? [String: Any], let errors = response[ResponseErrorKeys.arrayErrors] as? [[String: Any]] {
        var parsedErrors: [ErrorResponseModel] = []
        errors.forEach({ error in
          if let parsedError = ErrorResponseModel.parse(dic: error) {
            parsedErrors.append(parsedError)
          }
        })
        return parsedErrors
      }
      
      if let response = $0.value as? Data, let convertedString = response.stringUTF8, let dic = convertStringJSONToDictionary(json: convertedString) {
        if let errors = dic[ResponseErrorKeys.arrayErrors] as? [[String: Any]] {
          
          var parsedErrors: [ErrorResponseModel] = []
          errors.forEach({ error in
            if let parsedError = ErrorResponseModel.parse(dic: error) {
              parsedErrors.append(parsedError)
            }
          })
          
          return parsedErrors
        }
      }
      
      return []
    }) ?? []
    
    statusCode = info.first(where: {$0.key == ResponseErrorKeys.statusCode }).map({
      return ($0.value as? Int ?? 0)
    })
    
    description = info.first(where: {$0.key == ResponseErrorKeys.description }).map({
      return ($0.value as? String ?? "")
    })
    
    status = info.first(where: {$0.key == "status" }).map({
      if let response = $0.value as? [String: Any], let status = response[ResponseErrorKeys.status] as? String {
        return status
      }
      return ""
    }) ?? ""
  }
  
  private func convertStringJSONToDictionary(json: String) -> [String: Any]? {
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

struct ErrorResponseModel: Decodable {
  var code: String?
  var message: String?
  
  private enum CodingKeys: String, CodingKey {
    case code = "codigo"
    case message = "mensagem"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    code = try container.decodeIfPresent(String.self, forKey: .code)
    message = try container.decodeIfPresent(String.self, forKey: .message)
  }
}
