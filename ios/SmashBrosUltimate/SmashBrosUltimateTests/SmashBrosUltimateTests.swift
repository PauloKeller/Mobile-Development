//
//  SmashBrosUltimateTests.swift
//  SmashBrosUltimateTests
//
//  Created by Paulo Keller on 17/01/22.
//

import XCTest
import RealmSwift
@testable import SmashBrosUltimate

class MockSBUApiProvider: SBUApiProviderProtocol {
  func fetchUniverses() async throws -> [SBUUniverseModel] {
    let mockOne = SBUUniverseModel()
    mockOne.name = "mockone"
    mockOne.objectID = "mockOne"
    mockOne.universeDescription = "descOne"
    
    let mockTwo = SBUUniverseModel()
    mockOne.name = "mocktwo"
    mockOne.objectID = "mocktwo"
    mockOne.universeDescription = "desctwo"
    return [mockOne, mockTwo]
  }
  
  func fetchFighters(filter: String?) async throws -> [SBUFighterModel] {
    let mockOne = SBUFighterModel()
    mockOne.objectID = "mockOne"
    mockOne.name = "mockOne"
    mockOne.universe = "mockOne"
    mockOne.rate = 5
    return [mockOne]
  }
}

class SmashBrosUltimateTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testFetchUniversesFromRepository() async throws {
    let realm = try! Realm()
    
    let repository = SBURepository(provider: MockSBUApiProvider(), realm: realm)
    let data = try await repository.fetchUniverses()
    
    XCTAssertEqual(data.count, 2)
  }
  
  func testFetchFightersFromRepository() async throws {
    let realm = try! Realm()
    
    let repository = SBURepository(provider: MockSBUApiProvider(), realm: realm)
    let data = try await repository.fetchFighters(filter: nil)
    
    XCTAssertEqual(data.isEmpty, false)
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
