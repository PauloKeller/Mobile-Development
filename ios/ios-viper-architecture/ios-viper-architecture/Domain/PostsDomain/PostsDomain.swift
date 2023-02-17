//
//  PostsDomain.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 03/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

enum PostsResponseError {
  case unknown
  case permissionDenied
  case wrongDueDate
  case alreadyCreated
}

extension PostsResponseError {
  enum Code {
    static let kCode167 = "167"
    static let kCode174 = "174"
    static let kCode172 = "172"
  }
}

protocol PostsDomainProtocol: class {
  func getPosts()
  func getPost(by id:Int64)
}

protocol GetPostsResponseProtocol: class {
  func responseGetPostsSuccess(response: ResponseSuccessCallback<[PostModel]>)
  func responseGetPostsError(error: ResponseErrorCallback?)
}

protocol GetPostResponseProtocol: class {
  func responseGetPostSuccess(response: ResponseSuccessCallback<PostModel>)
  func responseGetPostError(error: ResponseErrorCallback?)
}

final class PostsDomain {
  private var provider: JsonPlaceHolderProviderProtocol?
  weak var responsePosts: GetPostsResponseProtocol?
  weak var responsePost: GetPostResponseProtocol?
  
  init(provider: JsonPlaceHolderProviderProtocol) {
    self.provider = provider
  }
}

extension PostsDomain: PostsDomainProtocol {
  func getPost(by id: Int64) {
    provider?.getPost(id: id, successCallback: { [self] data  in
      responsePost?.responseGetPostSuccess(response: data)
    }, failureCallback: { [self] error in
      responsePost?.responseGetPostError(error: error)
    })
  }
  
  func getPosts() {
    provider?.getPosts(successCallback: { [self] data  in
      responsePosts?.responseGetPostsSuccess(response: data)
    }, failureCallback: { [self] error in
      responsePosts?.responseGetPostsError(error: error)
    })
  }
}
