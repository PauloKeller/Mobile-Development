//
//  AllGamesViewModel.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 19/01/22.
//

import Foundation
import RealmSwift

enum AllGamesViewModelState {
  case loading
  case na
  case success
  case failed
}

@MainActor
class AllGamesViewModel: ObservableObject {
  private let repository: SBURepositoryProtocol
  
  @Published var state: AllGamesViewModelState = .success
  @Published var universes: [SBUUniverseModel] = []
  @Published var fighters: [SBUFighterModel] = []
  
  init(repository: SBURepositoryProtocol) {
    self.repository = repository
  }

  public func getData() {
    universes = repository.getUniverses()
    fighters = repository.getFigthers()
  }
  
  public func pullToRefresh() {
   //TODO: Implement
  }
  
  public func filterByUniverse(name: String) {
    let fighters = repository.getFigthers()
    
    if name == "All" {
      self.fighters = fighters
    } else {
      let filtered = fighters.filter({ $0.universe == name })
      self.fighters = filtered
    }
  }
  
  public func getUniverseNames() -> [String] {
    var names = [String]()
    names.insert("All", at: 0)
    
    for universe in universes {
      if let name = universe.name {
        names.append(name)
      }
    }
    
    return names
  }
}


