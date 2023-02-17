//
//  HomePresenter.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 17/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation
import UIKit

final class HomePresenter {
  
  // MARK: - Private properties
  private enum Strings {
    static let title = "Home"
  }
  
  private enum Constants {
    static let cellRowHeight: CGFloat = 100.0
  }
  
  private weak var view: HomeViewInterface?
  private let wireframe: HomeWireframeInterface
  private let interactor: HomeInteractorProtocol
  private var posts: [PostModel] = []
  private var filteredPosts: [PostModel] = []
  
  let navTitle = Strings.title
  
  // MARK: - Lifecycle
  
  init(wireframe: HomeWireframeInterface, view: HomeViewInterface, interactor: HomeInteractorProtocol) {
    self.wireframe = wireframe
    self.view = view
    self.interactor = interactor
  }
  
  private func setupCell(cell: HomePostsTableViewCell, post: PostModel) -> HomePostsTableViewCell {
    cell.setupProperties(title: post.title, body: post.body)
    return cell
  }
}

// MARK: - Extensions

extension HomePresenter: HomePresenterInterface {
  func loadData() {
    interactor.getPosts()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredPosts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell =  tableView.dequeueReusableCell(withIdentifier: HomePostsTableViewCell.id, for: indexPath) as? HomePostsTableViewCell else {
      return UITableViewCell()
    }
    
    return setupCell(cell: cell, post: filteredPosts[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Constants.cellRowHeight
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let post = filteredPosts[indexPath.row]
    interactor.getPost(by: post.id)
  }
}

extension HomePresenter: HomeInteractorResponseProtocol {
  func responseGetPostSuccess(post: PostModel) {
    wireframe.navigate(to: .goToDetails(post: post))
  }
  
  func responseGetPostError(error: ResponseErrorCallback?) {
    
  }
  
  func networkingNotAvailable() {
    wireframe.navigate(to: .showErrorNoInternetConnection)
  }
  
  func responseGetPostsSuccess(posts: [PostModel]) {
    self.posts = posts
    self.filteredPosts = self.posts
    
    view?.reloadTableView()
  }
  
  func responseGetPostsError(error: ResponseErrorCallback?) {
    
  }
}
