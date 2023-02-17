//
//  HomeInteractor.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 17/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

final class HomeInteractor {
  let domain: PostsDomainProtocol
  weak var delegate: HomeInteractorResponseProtocol?
  
  init(domain: PostsDomainProtocol) {
    self.domain = domain
  }
}

extension HomeInteractor: HomeInteractorProtocol {
  func getPost(by id: Int64) {
    networking.check(.getPost(id: id))
  }
  
  func getPosts() {
    networking.check(.getPosts)
  }
}

extension HomeInteractor: NetworkingInteractorResponse {
  func networkingAvailable(_ ID: NetworkResponseType) {
    switch ID {
    case .getPosts:
      domain.getPosts()
    case .getPost(let id):
      domain.getPost(by: id)
    default:
      break
    }
  }
  
  func networkingNotAvailable(_ ID: NetworkResponseType) {
    delegate?.networkingNotAvailable()
  }
}

extension HomeInteractor: GetPostsResponseProtocol {
  func responseGetPostsSuccess(response: ResponseSuccessCallback<[PostModel]>) {
    if let model = response.data {
      delegate?.responseGetPostsSuccess(posts: model)
    } else {
      delegate?.responseGetPostsError(error: nil)
    }
  }
  
  func responseGetPostsError(error: ResponseErrorCallback?) {
    delegate?.responseGetPostsError(error: error)
  }
}

extension HomeInteractor: GetPostResponseProtocol {
  func responseGetPostSuccess(response: ResponseSuccessCallback<PostModel>) {
    if let model = response.data {
      delegate?.responseGetPostSuccess(post: model)
    } else {
      delegate?.responseGetPostError(error: nil)
    }
  }
  
  func responseGetPostError(error: ResponseErrorCallback?) {
    delegate?.responseGetPostError(error: error)
  }
  
  
}

