//
//  ViewModel.swift
//  Async
//
//  Created by Paulo Keller on 07/12/21.
//

import Foundation

@MainActor
class CharacterViewModel: ObservableObject {
  enum State {
    case na
    case loading
    case success(data: [Character])
    case failed(error: Error)
  }
  
  @Published private(set) var state: State = .na
  @Published var hasError: Bool = false
  
  private let service: CharacterService
  
  init(service: CharacterService) {
    self.service = service
  }
  
  func getCharacters() async {
    self.state = .loading
    self.hasError = false
    
    do {
      let characters = try await service.fetchCharacters()
      self.state = .success(data: characters)
    } catch {
      self.state = .failed(error: error)
      self.hasError = true
    }
  }
}
