//
//  HomeInterfaces.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 17/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewInterface: ViewInterface {
  func reloadTableView()
}

protocol HomePresenterInterface: PresenterInterface {
  var navTitle: String { get }
  func loadData()
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

enum HomeNavigationOption {
  case showErrorNoInternetConnection
  case showExceptionError(title: String, message: String, buttonSuccessText: String, doneCallback: () -> Void)
  case genericError(doneCallback: () -> Void)
  case goToDetails(post: PostModel)
}

protocol HomeWireframeInterface: WireframeInterface {
  func navigate(to option: HomeNavigationOption)
}

protocol HomeInteractorResponseProtocol: class {
  func networkingNotAvailable()
  func responseGetPostsSuccess(posts: [PostModel])
  func responseGetPostsError(error: ResponseErrorCallback?)
  func responseGetPostSuccess(post: PostModel)
  func responseGetPostError(error: ResponseErrorCallback?)
}

protocol HomeInteractorProtocol: InteractorInterface {
  func getPosts()
  func getPost(by id:Int64)
}
