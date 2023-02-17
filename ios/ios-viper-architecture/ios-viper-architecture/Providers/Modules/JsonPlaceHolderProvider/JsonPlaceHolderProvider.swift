//
//  JsonPlaceHolderProvider.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 16/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

protocol JsonPlaceHolderProviderProtocol {
  func getPosts(successCallback: @escaping (ResponseSuccessCallback<[PostModel]>) -> Void, failureCallback: @escaping (ResponseErrorCallback) -> Void)
  func getPost(id: Int64, successCallback: @escaping (ResponseSuccessCallback<PostModel>) -> Void, failureCallback: @escaping (ResponseErrorCallback) -> Void)
  }

class JsonPlaceHolderProvider {
  enum EndPoints: ProviderBase, RouterJsonPlaceHolder {
    case getPosts
    case getPost(id: Int64)
    
    internal var path: String {
      switch self {
      case .getPosts:
        return "/posts"
      case .getPost(let id):
        return "/posts/\(id)"
      }
    }
    
    internal var method: RouterHTTPMethod {
      switch self {
      case .getPosts, .getPost:
        return .get
      }
    }
  }
}

extension JsonPlaceHolderProvider: JsonPlaceHolderProviderProtocol {
  func getPost(id: Int64, successCallback: @escaping (ResponseSuccessCallback<PostModel>) -> Void, failureCallback: @escaping (ResponseErrorCallback) -> Void) {
    EndPoints.getPost(id: id).request(successBlock: successCallback, failureBlock: failureCallback)
  }
  
  func getPosts(successCallback: @escaping (ResponseSuccessCallback<[PostModel]>) -> Void, failureCallback: @escaping (ResponseErrorCallback) -> Void) {
    EndPoints.getPosts.request(successBlock: successCallback, failureBlock: failureCallback)
  }
}
