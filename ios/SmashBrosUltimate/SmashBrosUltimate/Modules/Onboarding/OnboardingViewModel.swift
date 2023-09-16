//
//  OnboardingViewModel.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 21/01/22.
//

import Foundation

@MainActor
class OnboardingViewModel: ObservableObject {
  private let repository: SBURepositoryProtocol
  private var universes: [SBUUniverseModel] = []
  private var fighters: [SBUFighterModel] = []
  
  @Published var index = 0
  @Published var willMoveToNextScreen = false
  
  init(repository: SBURepositoryProtocol) {
    self.repository = repository
  }
  
  private func fetchUniverses() async {
    guard let universes = try? await repository.fetchUniverses() else { return }
    
    if !universes.isEmpty {
      self.universes = universes
    }
  }
  
  private func fetchFighters() async {
    guard let fighters = try? await repository.fetchFighters(filter: nil) else { return }
    
    if !fighters.isEmpty {
      self.fighters = fighters
    }
  }
  
  private func saveCache() {
    if !fighters.isEmpty {
      repository.saveFighters(data: fighters)
    }
    
    if !universes.isEmpty {
      repository.saveUniverses(data: universes)
    }
  }
  
  public func fetchData() async {
    await fetchUniverses()
    await fetchFighters()
  }
  
  public func goToAllGamesScreen() {
    saveCache()
    SharedPreferencesManager.shared.setIsNotFirstTime(value: true)
    willMoveToNextScreen = true
  }
}

