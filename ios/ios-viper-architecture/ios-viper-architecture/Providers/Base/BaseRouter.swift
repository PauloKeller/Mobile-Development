//
//  BaseRouter.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 14/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation
import Alamofire

typealias SuccessCallback = (_ data: AnyObject) -> Swift.Void
typealias FailureCallback = (_ error: Error) -> Swift.Void
typealias SuccessTypedCallBack<T> = (_ data: T) -> Void
typealias ErrorDescription = (errorCode: String, errorMessage: String)

public enum RouterHTTPMethod: String {
  case options = "OPTIONS"
  case get = "GET"
  case head = "HEAD"
  case post = "POST"
  case put = "PUT"
  case patch = "PATCH"
  case delete = "DELETE"
  case trace = "TRACE"
  case connect = "CONNECT"
}

private enum CustomErrorCoding {
  static let unauthorizeDevice = "0001"
}

internal class BaseRouter {
  // MARK: - Constants
  
  // MARK: - Methods
  
  func request(method: RouterHTTPMethod, endPoint: String, params: [String:Any]?, headers: HTTPHeaders? = nil, trackFailure: Bool = false, tagTrackFailure: String = "", trackSuccess: Bool = false, tagTrackSuccess: String = "", successBlock: @escaping SuccessCallback, failureBlock: @escaping FailureCallback) {
    
    var header: HTTPHeaders = [
      .accept("application/json")
    ]
    
    if let headers = headers {
      header = headers
    }

    let bodyParams:[String:Any] = params ?? [:]
    print(bodyParams)
  
    printRequestForQA(method: method, path: endPoint, params: bodyParams, header: header)
    
    var httpMethod: HTTPMethod {
      switch method {
      case .get:
        return HTTPMethod.get
      case .post:
        return HTTPMethod.post
      case .put:
        return HTTPMethod.put
      default:
        fatalError("Request without HTTPMethod")
      }
    }
    
    AF.request(endPoint, method: httpMethod, parameters: bodyParams, headers: header).responseJSON { response in
      switch response.result {
      case .success:
        guard let responseData = response.data as AnyObject? else { return }
        guard let responseValue = response.value as AnyObject? else { return }
        
        self.printResponseSuccessForQA(path: endPoint, response: responseValue, showStackTraceLog: true)
        
        successBlock(responseData)
      case let .failure(error):
        self.printResponseErrorForQA(path: endPoint, error: error)
        
        failureBlock(error)
        return
      }
  }
    
  }
}

extension BaseRouter {
  /// (Only QA environment) Prints request of requisition
  ///
  /// - Parameters:
  ///   - method: HTTPMethod
  ///   - path: endpoint path
  ///   - params: params of request
  private func printRequestForQA(method: RouterHTTPMethod, path: String, params: [String: Any]?, header: HTTPHeaders?) {
    #if DEBUG_LOG
      let json = params?.prettyPrintedJSON
    
      NSLog("\n")
      NSLog("[CleanArchitecture]  🔸 REQUEST 🔸")
      NSLog("[CleanArchitecture]  Header: \(String(describing: header))")
      NSLog("[CleanArchitecture]  \(method.rawValue) \n\(path)")
      NSLog("[CleanArchitecture]  JSON: \n\(json ?? "–")")
      NSLog("\n")
    #endif
  }
  
  /// (Only QA environment) Prints success response of requisition
  ///
  /// - Parameters:
  ///   - path: endpoint path
  ///   - response: response of requisition
  private func printResponseSuccessForQA(path: String, response: AnyObject, showStackTraceLog: Bool = true) {
    #if DEBUG_LOG
      NSLog("\n")
      NSLog("[CleanArchitecture]  🔹 RESPONSE 🔹")
      NSLog("[CleanArchitecture]  ENDPOINT: \n\(path)")

      var myString = ""

      if let resp = response as? CVarArg {
        NSLog("[CleanArchitecture]  DIC: \n")

        let offset = 800.0
        let respText = String(format: "%@", resp)
        let respSize = Double(respText.lengthOfBytes(using: String.Encoding.ascii))-1
        let size = Int((respSize/offset).rounded())
        
        if !showStackTraceLog {
          return
        }
        
        for i in 0..<size {
          let start = respText.index(respText.startIndex, offsetBy: i*Int(offset))
          var offsetBy = (i+1)*Int(offset)

          if i+1 == size {
            offsetBy = Int(respSize)
          }

          let end = respText.index(respText.startIndex, offsetBy: offsetBy)
          let range = start..<end
          let mySubstring = respText[range]
          myString = String(mySubstring)

          NSLog("[CleanArchitecture] Part [\(i/size)] %@", myString)
        }
      }

      NSLog("\n")
    #endif
  }
  
  /// (Only QA environment) Prints error response of requisition
  ///
  /// - Parameters:
  ///   - path: endpoint path
  ///   - error: error of requisition
  private func printResponseErrorForQA(path: String, error: Error) {
    let userInfo = error._userInfo
    let info = userInfo?.mutableCopy() as? [String: Any]

    #if DEBUG_LOG
      let json = info?.prettyPrintedJSON

      NSLog("\n")
      NSLog("[CleanArchitecture]  ❌ RESPONSE ❌")
      NSLog("[CleanArchitecture]  ENDPOINT: \n\(path)")
      NSLog("[CleanArchitecture]  ERROR: \n\(json ?? "–")")
      NSLog("\n")
    #endif
  }
}
